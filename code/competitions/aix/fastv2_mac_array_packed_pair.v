`timescale 1ns/1ps
// Quad18 FastV3: two signed INT8 dot-products with one shared-weight DSP lane.
//
// Normal 3x3 mode keeps the original packed-pair behavior: 144 DSP lanes
// compute two spatial dot-products for one output channel.
//
// 1x1 quad4 mode reuses the same 144 DSP lanes differently.  Four groups of
// 32 lanes compute four output channels over the same 2x2 spatial tile:
//   lanes ocg*32+0..15   -> pix0/pix1 for OC base+ocg
//   lanes ocg*32+16..31  -> pix2/pix3 for OC base+ocg
// The segmented reducer serializes one OC per cycle into the existing quad
// accumulator write path, so no extra DSP array or accumulator ports are added.
// D6.61: allow Vivado to flatten this datapath hierarchy for resource/timing optimization.
module fastv2_mac_array_packed_pair #(
    parameter integer NUM_MACS = 144,
    parameter integer DATA_W   = 8,
    parameter integer ACC_W    = 32
)(
    input  wire                         i_clk,
    input  wire                         i_rst,
    input  wire                         i_valid,
    input  wire                         i_k1_mode,
    input  wire [15:0]                  i_oc_idx,
    input  wire                         i_first_cb,
    input  wire [NUM_MACS*DATA_W-1:0]   i_ifm0_vec,
    input  wire [NUM_MACS*DATA_W-1:0]   i_ifm1_vec,
    input  wire [NUM_MACS*DATA_W-1:0]   i_wgt_vec,
    output reg                          o_valid,
    output reg  signed [ACC_W-1:0]      o_sum0,
    output reg  signed [ACC_W-1:0]      o_sum1,
    output reg                          o_k1_valid,
    output reg  [15:0]                  o_k1_oc_idx,
    output reg                          o_k1_first_cb,
    output reg  signed [ACC_W-1:0]      o_k1_sum0,
    output reg  signed [ACC_W-1:0]      o_k1_sum1,
    output reg  signed [ACC_W-1:0]      o_k1_sum2,
    output reg  signed [ACC_W-1:0]      o_k1_sum3,
    output reg                          o_k1_wide_valid,
    output reg  [15:0]                  o_k1_wide_oc_idx,
    output reg                          o_k1_wide_first_cb,
    output reg  [16*ACC_W-1:0]          o_k1_wide_sums
);

    integer k;
    // D6.148: internal reducer width is capped at SUM_W. A 144-term INT8 dot product
    // fits in signed 23 bits, while external accumulators/postproc remain 32-bit.
    localparam integer SUM_W = 23;

    function signed [ACC_W-1:0] sext_sum;
        input signed [SUM_W-1:0] v;
        begin
            sext_sum = {{(ACC_W-SUM_W){v[SUM_W-1]}}, v};
        end
    endfunction

    reg v0, v1, v2, v3, v4, v5, v6, v7, v8;
    reg k1_v0, k1_v1, k1_v2, k1_v3, k1_v4, k1_v5;
    reg [15:0] k1_oc0, k1_oc1, k1_oc2, k1_oc3, k1_oc4, k1_oc5;
    reg        k1_first0, k1_first1, k1_first2, k1_first3, k1_first4, k1_first5;

    (* use_dsp = "yes" *) reg signed [42:0] packed_prod [0:NUM_MACS-1];
    reg ifm0_sign_d [0:NUM_MACS-1];
    reg ifm1_sign_d [0:NUM_MACS-1];
    reg ifm0_nz_d [0:NUM_MACS-1];
    reg signed [7:0] wgt_d [0:NUM_MACS-1];
    (* use_dsp = "no" *) reg signed [15:0] prod0 [0:NUM_MACS-1];
    (* use_dsp = "no" *) reg signed [15:0] prod1 [0:NUM_MACS-1];

    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_1 [0:71];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_2 [0:35];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_3 [0:17];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_4 [0:8];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_5 [0:4];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_6 [0:2];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s0_7 [0:1];

    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_1 [0:71];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_2 [0:35];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_3 [0:17];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_4 [0:8];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_5 [0:4];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_6 [0:2];
    (* use_dsp = "no" *) reg signed [SUM_W-1:0] s1_7 [0:1];

    // 1x1 quad4 segmented reducers.  There are eight 16-lane groups:
    // two spatial-pair groups for each of four output channels.

    reg                         k1_emit_active;
    reg [1:0]                   k1_emit_idx;
    reg [15:0]                  k1_emit_oc_base;
    reg                         k1_emit_first;
    reg signed [ACC_W-1:0]      k1_pix0 [0:3];
    reg signed [ACC_W-1:0]      k1_pix1 [0:3];
    reg signed [ACC_W-1:0]      k1_pix2 [0:3];
    reg signed [ACC_W-1:0]      k1_pix3 [0:3];

    wire signed [DATA_W-1:0] ifm0_byte [0:NUM_MACS-1];
    wire signed [DATA_W-1:0] ifm1_byte [0:NUM_MACS-1];
    wire signed [DATA_W-1:0] wgt_byte  [0:NUM_MACS-1];
    wire [7:0] ifm0_u [0:NUM_MACS-1];
    wire signed [24:0] pack_a [0:NUM_MACS-1];
    wire signed [17:0] pack_b [0:NUM_MACS-1];
    (* use_dsp = "yes" *) wire signed [42:0] product_w [0:NUM_MACS-1];
    wire signed [15:0] low_product [0:NUM_MACS-1];
    wire signed [26:0] high_raw [0:NUM_MACS-1];
    wire signed [31:0] p0_corr [0:NUM_MACS-1];
    wire signed [31:0] p1_corr [0:NUM_MACS-1];

    genvar gi;
    generate
        for (gi = 0; gi < NUM_MACS; gi = gi + 1) begin : g_pack
            assign ifm0_byte[gi] = i_ifm0_vec[gi*DATA_W +: DATA_W];
            assign ifm1_byte[gi] = i_ifm1_vec[gi*DATA_W +: DATA_W];
            assign wgt_byte[gi]  = i_wgt_vec [gi*DATA_W +: DATA_W];
            assign ifm0_u[gi] = ifm0_byte[gi][7:0];
            assign pack_a[gi] = {1'b0, ifm1_byte[gi][7:0], 16'd0} | {17'd0, ifm0_u[gi]};
            assign pack_b[gi] = {{10{wgt_byte[gi][7]}}, wgt_byte[gi]};
            assign product_w[gi] = pack_a[gi] * pack_b[gi];
            assign low_product[gi] = packed_prod[gi][15:0];
            assign high_raw[gi] = packed_prod[gi] >>> 16;
            assign p0_corr[gi] =
                {{16{low_product[gi][15]}}, low_product[gi]} -
                (ifm0_sign_d[gi] ? {{16{wgt_d[gi][7]}}, wgt_d[gi], 8'b0} : 32'sd0);
            assign p1_corr[gi] =
                {{5{high_raw[gi][26]}}, high_raw[gi]} +
                ((wgt_d[gi][7] && ifm0_nz_d[gi]) ? 32'sd1 : 32'sd0) -
                (ifm1_sign_d[gi] ? {{16{wgt_d[gi][7]}}, wgt_d[gi], 8'b0} : 32'sd0);
        end
    endgenerate

    always @(posedge i_clk) begin
        if (i_rst) begin
            v0 <= 1'b0; k1_v0 <= 1'b0; k1_oc0 <= 16'd0; k1_first0 <= 1'b0;
            for (k = 0; k < NUM_MACS; k = k + 1) begin
                packed_prod[k] <= 43'sd0;
                ifm0_sign_d[k] <= 1'b0;
                ifm1_sign_d[k] <= 1'b0;
                ifm0_nz_d[k] <= 1'b0;
                wgt_d[k] <= 8'sd0;
            end
        end else begin
            v0 <= i_valid;
            k1_v0 <= i_valid & i_k1_mode;
            k1_oc0 <= i_oc_idx;
            k1_first0 <= i_first_cb;
            for (k = 0; k < NUM_MACS; k = k + 1) begin
                packed_prod[k] <= product_w[k];
                ifm0_sign_d[k] <= ifm0_byte[k][7];
                ifm1_sign_d[k] <= ifm1_byte[k][7];
                ifm0_nz_d[k] <= |ifm0_u[k];
                wgt_d[k] <= wgt_byte[k];
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v1 <= 1'b0; k1_v1 <= 1'b0; k1_oc1 <= 16'd0; k1_first1 <= 1'b0;
            for (k = 0; k < NUM_MACS; k = k + 1) begin
                prod0[k] <= 16'sd0;
                prod1[k] <= 16'sd0;
            end
        end else begin
            v1 <= v0;
            k1_v1 <= k1_v0; k1_oc1 <= k1_oc0; k1_first1 <= k1_first0;
            for (k = 0; k < NUM_MACS; k = k + 1) begin
                prod0[k] <= p0_corr[k][15:0];
                prod1[k] <= p1_corr[k][15:0];
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v2 <= 1'b0; k1_v2 <= 1'b0; k1_oc2 <= 16'd0; k1_first2 <= 1'b0;
            for (k = 0; k < 72; k = k + 1) begin
                s0_1[k] <= {ACC_W{1'b0}};
                s1_1[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v2 <= v1;
            k1_v2 <= k1_v1; k1_oc2 <= k1_oc1; k1_first2 <= k1_first1;
            for (k = 0; k < 72; k = k + 1) begin
                s0_1[k] <= {{(SUM_W-16){prod0[2*k][15]}}, prod0[2*k]} +
                           {{(SUM_W-16){prod0[2*k+1][15]}}, prod0[2*k+1]};
                s1_1[k] <= {{(SUM_W-16){prod1[2*k][15]}}, prod1[2*k]} +
                           {{(SUM_W-16){prod1[2*k+1][15]}}, prod1[2*k+1]};
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v3 <= 1'b0; k1_v3 <= 1'b0; k1_oc3 <= 16'd0; k1_first3 <= 1'b0;
            for (k = 0; k < 36; k = k + 1) begin
                s0_2[k] <= {ACC_W{1'b0}};
                s1_2[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v3 <= v2;
            k1_v3 <= k1_v2; k1_oc3 <= k1_oc2; k1_first3 <= k1_first2;
            for (k = 0; k < 36; k = k + 1) begin
                s0_2[k] <= s0_1[2*k] + s0_1[2*k+1];
                s1_2[k] <= s1_1[2*k] + s1_1[2*k+1];
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v4 <= 1'b0; k1_v4 <= 1'b0; k1_oc4 <= 16'd0; k1_first4 <= 1'b0;
            for (k = 0; k < 18; k = k + 1) begin
                s0_3[k] <= {ACC_W{1'b0}};
                s1_3[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v4 <= v3;
            k1_v4 <= k1_v3; k1_oc4 <= k1_oc3; k1_first4 <= k1_first3;
            for (k = 0; k < 18; k = k + 1) begin
                s0_3[k] <= s0_2[2*k] + s0_2[2*k+1];
                s1_3[k] <= s1_2[2*k] + s1_2[2*k+1];
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v5 <= 1'b0; k1_v5 <= 1'b0; k1_oc5 <= 16'd0; k1_first5 <= 1'b0;
            for (k = 0; k < 9; k = k + 1) begin
                s0_4[k] <= {ACC_W{1'b0}};
                s1_4[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v5 <= v4;
            k1_v5 <= k1_v4; k1_oc5 <= k1_oc4; k1_first5 <= k1_first4;
            for (k = 0; k < 9; k = k + 1) begin
                s0_4[k] <= s0_3[2*k] + s0_3[2*k+1];
                s1_4[k] <= s1_3[2*k] + s1_3[2*k+1];
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v6 <= 1'b0;
            for (k = 0; k < 5; k = k + 1) begin
                s0_5[k] <= {ACC_W{1'b0}};
                s1_5[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v6 <= v5;
            for (k = 0; k < 4; k = k + 1) begin
                s0_5[k] <= s0_4[2*k] + s0_4[2*k+1];
                s1_5[k] <= s1_4[2*k] + s1_4[2*k+1];
            end
            s0_5[4] <= s0_4[8];
            s1_5[4] <= s1_4[8];
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v7 <= 1'b0;
            for (k = 0; k < 3; k = k + 1) begin
                s0_6[k] <= {ACC_W{1'b0}};
                s1_6[k] <= {ACC_W{1'b0}};
            end
        end else begin
            v7 <= v6;
            s0_6[0] <= s0_5[0] + s0_5[1];
            s0_6[1] <= s0_5[2] + s0_5[3];
            s0_6[2] <= s0_5[4];
            s1_6[0] <= s1_5[0] + s1_5[1];
            s1_6[1] <= s1_5[2] + s1_5[3];
            s1_6[2] <= s1_5[4];
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v8 <= 1'b0;
            s0_7[0] <= {ACC_W{1'b0}};
            s0_7[1] <= {ACC_W{1'b0}};
            s1_7[0] <= {ACC_W{1'b0}};
            s1_7[1] <= {ACC_W{1'b0}};
        end else begin
            v8 <= v7;
            s0_7[0] <= s0_6[0] + s0_6[1];
            s0_7[1] <= s0_6[2];
            s1_7[0] <= s1_6[0] + s1_6[1];
            s1_7[1] <= s1_6[2];
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            o_valid <= 1'b0;
            o_sum0 <= {ACC_W{1'b0}};
            o_sum1 <= {ACC_W{1'b0}};
        end else begin
            o_valid <= v8;
            o_sum0 <= sext_sum(s0_7[0] + s0_7[1]);
            o_sum1 <= sext_sum(s1_7[0] + s1_7[1]);
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            k1_emit_active <= 1'b0;
            k1_emit_idx <= 2'd0;
            k1_emit_oc_base <= 16'd0;
            k1_emit_first <= 1'b0;
            o_k1_valid <= 1'b0;
            o_k1_oc_idx <= 16'd0;
            o_k1_first_cb <= 1'b0;
            o_k1_sum0 <= {ACC_W{1'b0}};
            o_k1_sum1 <= {ACC_W{1'b0}};
            o_k1_sum2 <= {ACC_W{1'b0}};
            o_k1_sum3 <= {ACC_W{1'b0}};
            o_k1_wide_valid <= 1'b0;
            o_k1_wide_oc_idx <= 16'd0;
            o_k1_wide_first_cb <= 1'b0;
            o_k1_wide_sums <= {16*ACC_W{1'b0}};
            for (k = 0; k < 4; k = k + 1) begin
                k1_pix0[k] <= {ACC_W{1'b0}};
                k1_pix1[k] <= {ACC_W{1'b0}};
                k1_pix2[k] <= {ACC_W{1'b0}};
                k1_pix3[k] <= {ACC_W{1'b0}};
            end
        end else begin
            o_k1_valid <= 1'b0;
            o_k1_wide_valid <= 1'b0;
            if (k1_v5) begin
                o_k1_wide_valid <= 1'b1;
                o_k1_wide_oc_idx <= k1_oc5;
                o_k1_wide_first_cb <= k1_first5;
                for (k = 0; k < 4; k = k + 1) begin
                    o_k1_wide_sums[(0*4+k)*ACC_W +: ACC_W] <= sext_sum(s0_4[2*k]);
                    o_k1_wide_sums[(1*4+k)*ACC_W +: ACC_W] <= sext_sum(s1_4[2*k]);
                    o_k1_wide_sums[(2*4+k)*ACC_W +: ACC_W] <= sext_sum(s0_4[2*k+1]);
                    o_k1_wide_sums[(3*4+k)*ACC_W +: ACC_W] <= sext_sum(s1_4[2*k+1]);
                end
            end
            if (k1_emit_active) begin
                o_k1_valid <= 1'b1;
                o_k1_oc_idx <= k1_emit_oc_base + {14'd0, k1_emit_idx};
                o_k1_first_cb <= k1_emit_first;
                o_k1_sum0 <= k1_pix0[k1_emit_idx];
                o_k1_sum1 <= k1_pix1[k1_emit_idx];
                o_k1_sum2 <= k1_pix2[k1_emit_idx];
                o_k1_sum3 <= k1_pix3[k1_emit_idx];
                if (k1_emit_idx == 2'd3) begin
                    // Accept the next quad4 result on the same cycle that the
                    // previous quad4 emits its final OC.  Without this handoff,
                    // a start interval of four cycles drops every other group.
                    if (k1_v5) begin
                        k1_emit_active <= 1'b1;
                        k1_emit_idx <= 2'd0;
                        k1_emit_oc_base <= k1_oc5;
                        k1_emit_first <= k1_first5;
                        for (k = 0; k < 4; k = k + 1) begin
                            k1_pix0[k] <= sext_sum(s0_4[2*k]);
                            k1_pix1[k] <= sext_sum(s1_4[2*k]);
                            k1_pix2[k] <= sext_sum(s0_4[2*k+1]);
                            k1_pix3[k] <= sext_sum(s1_4[2*k+1]);
                        end
                    end else begin
                        k1_emit_active <= 1'b0;
                        k1_emit_idx <= 2'd0;
                    end
                end else begin
                    k1_emit_idx <= k1_emit_idx + 1'b1;
                end
            end else if (k1_v5) begin
                k1_emit_active <= 1'b1;
                k1_emit_idx <= 2'd0;
                k1_emit_oc_base <= k1_oc5;
                k1_emit_first <= k1_first5;
                for (k = 0; k < 4; k = k + 1) begin
                    k1_pix0[k] <= sext_sum(s0_4[2*k]);
                    k1_pix1[k] <= sext_sum(s1_4[2*k]);
                    k1_pix2[k] <= sext_sum(s0_4[2*k+1]);
                    k1_pix3[k] <= sext_sum(s1_4[2*k+1]);
                end
            end
        end
    end
endmodule
