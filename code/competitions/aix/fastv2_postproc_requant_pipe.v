`timescale 1ns/1ps
// Throughput-1 fixed-point requantizer for FastV2.  The multiplier is split
// into two 16-bit coefficient halves with an explicit register between the DSP
// partial products and the final add.  This avoids the routed DSP-to-DSP path
// that failed timing when the L0 fast path was restored.
// D6.61: allow Vivado to flatten this datapath hierarchy for resource/timing optimization.
module fastv2_postproc_requant_pipe #(
    parameter integer ACC_W = 32,
    parameter integer ENABLE_SIGNED = 0
)(
    input  wire                    i_clk,
    input  wire                    i_rst,
    input  wire                    i_valid,
    input  wire signed [ACC_W-1:0] i_sum,
    input  wire signed [ACC_W-1:0] i_bias,
    input  wire [31:0]             i_requant_mul,
    input  wire [31:0]             i_requant_round,
    input  wire [5:0]              i_requant_shift,
    input  wire                    i_relu_en,
    input  wire                    i_output_signed,
    input  wire [1:0]              i_pix_idx,
    input  wire [4:0]              i_oc_idx,
    output reg                     o_valid,
    output reg  [1:0]              o_pix_idx,
    output reg  [4:0]              o_oc_idx,
    output reg  [7:0]              o_data
);
    localparam integer SRC_W = ACC_W + 2;
    localparam integer PART_W = SRC_W + 17;
    localparam integer PROD_W = PART_W + 17;
    localparam signed [PROD_W-1:0] CLAMP_MAX = {{(PROD_W-8){1'b0}}, 8'hff};
    localparam signed [PROD_W-1:0] SIGNED_CLAMP_MAX = 127;
    localparam signed [PROD_W-1:0] SIGNED_CLAMP_MIN = -128;

    reg v0, v1, v2, v3, v4, v5, v6;
    reg [1:0] pix0, pix1, pix2, pix3, pix4, pix5, pix6;
    reg [4:0] oc0, oc1, oc2, oc3, oc4, oc5, oc6;
    reg out_signed0, out_signed1, out_signed2, out_signed3, out_signed4, out_signed5, out_signed6;
    reg [31:0] mul0;
    reg [31:0] round0, round1, round2;
    reg [5:0] shift0, shift1, shift2, shift3, shift4;
    reg signed [SRC_W-1:0] src0;
    // D6.66: keep requant partial products in DSPs even under area-oriented
    // synthesis.  AreaOptimized_* moved these into carry/LUT multipliers and
    // created the D6.64/D6.65 -2.5ns timing path.
    (* use_dsp = "yes" *) reg signed [PART_W-1:0] prod_lo1;
    (* use_dsp = "yes" *) reg signed [PART_W-1:0] prod_hi1;
    reg signed [PROD_W-1:0] prod2;
    reg signed [PROD_W-1:0] round3;
    reg signed [PROD_W-1:0] shift_src4;
    reg signed [PROD_W-1:0] shifted5;
    reg shift_neg4;
    reg [7:0] clamp5;

    wire signed [SRC_W-1:0] sum_bias_w =
        $signed({{(SRC_W-ACC_W){i_sum[ACC_W-1]}}, i_sum}) +
        $signed({{(SRC_W-ACC_W){i_bias[ACC_W-1]}}, i_bias});

    function [7:0] clamp_byte;
        input signed [PROD_W-1:0] value;
        input signed_mode;
        begin
            if ((ENABLE_SIGNED != 0) && signed_mode) begin
                if (value > SIGNED_CLAMP_MAX) clamp_byte = 8'h7f;
                else if (value < SIGNED_CLAMP_MIN) clamp_byte = 8'h80;
                else clamp_byte = value[7:0];
            end else begin
                if (value < 0) clamp_byte = 8'h00;
                else if (value > CLAMP_MAX) clamp_byte = 8'hff;
                else clamp_byte = value[7:0];
            end
        end
    endfunction

    always @(posedge i_clk) begin
        if (i_rst) begin
            v0 <= 1'b0;
            pix0 <= 2'd0;
            oc0 <= 5'd0;
            out_signed0 <= 1'b0;
            src0 <= {SRC_W{1'b0}};
            mul0 <= 32'd0;
            round0 <= 32'd0;
            shift0 <= 6'd0;
        end else begin
            v0 <= i_valid;
            pix0 <= i_pix_idx;
            oc0 <= i_oc_idx;
            out_signed0 <= i_output_signed;
            mul0 <= i_requant_mul;
            round0 <= i_requant_round;
            shift0 <= i_requant_shift;
            src0 <= (i_relu_en && (sum_bias_w < 0)) ? {SRC_W{1'b0}} : sum_bias_w;
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v1 <= 1'b0;
            pix1 <= 2'd0;
            oc1 <= 5'd0;
            out_signed1 <= 1'b0;
            shift1 <= 6'd0;
            round1 <= 32'd0;
            prod_lo1 <= {PART_W{1'b0}};
            prod_hi1 <= {PART_W{1'b0}};
        end else begin
            v1 <= v0;
            pix1 <= pix0;
            oc1 <= oc0;
            out_signed1 <= out_signed0;
            shift1 <= shift0;
            round1 <= round0;
            prod_lo1 <= $signed(src0) * $signed({1'b0, mul0[15:0]});
            prod_hi1 <= $signed(src0) * $signed({1'b0, mul0[31:16]});
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v2 <= 1'b0;
            pix2 <= 2'd0;
            oc2 <= 5'd0;
            out_signed2 <= 1'b0;
            shift2 <= 6'd0;
            round2 <= 32'd0;
            prod2 <= {PROD_W{1'b0}};
        end else begin
            v2 <= v1;
            pix2 <= pix1;
            oc2 <= oc1;
            out_signed2 <= out_signed1;
            shift2 <= shift1;
            round2 <= round1;
            prod2 <= $signed({{(PROD_W-PART_W){prod_lo1[PART_W-1]}}, prod_lo1}) +
                     ($signed({{(PROD_W-PART_W){prod_hi1[PART_W-1]}}, prod_hi1}) <<< 16);
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v3 <= 1'b0;
            pix3 <= 2'd0;
            oc3 <= 5'd0;
            out_signed3 <= 1'b0;
            shift3 <= 6'd0;
            round3 <= {PROD_W{1'b0}};
        end else begin
            v3 <= v2;
            pix3 <= pix2;
            oc3 <= oc2;
            out_signed3 <= out_signed2;
            shift3 <= shift2;
            round3 <= prod2 + $signed({{(PROD_W-32){1'b0}}, round2});
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v4 <= 1'b0;
            pix4 <= 2'd0;
            oc4 <= 5'd0;
            out_signed4 <= 1'b0;
            shift4 <= 6'd0;
            shift_src4 <= {PROD_W{1'b0}};
            shift_neg4 <= 1'b0;
        end else begin
            v4 <= v3;
            pix4 <= pix3;
            oc4 <= oc3;
            out_signed4 <= out_signed3;
            shift4 <= shift3;
            if ((ENABLE_SIGNED != 0) && out_signed3 && (round3 < 0) && (shift3 != 0)) begin
                shift_src4 <= -round3;
                shift_neg4 <= 1'b1;
            end else begin
                shift_src4 <= round3;
                shift_neg4 <= 1'b0;
            end
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v5 <= 1'b0;
            pix5 <= 2'd0;
            oc5 <= 5'd0;
            out_signed5 <= 1'b0;
            shifted5 <= {PROD_W{1'b0}};
        end else begin
            v5 <= v4;
            pix5 <= pix4;
            oc5 <= oc4;
            out_signed5 <= out_signed4;
            shifted5 <= shift_neg4 ? -(shift_src4 >>> shift4) : (shift_src4 >>> shift4);
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            v6 <= 1'b0;
            pix6 <= 2'd0;
            oc6 <= 5'd0;
            out_signed6 <= 1'b0;
            clamp5 <= 8'd0;
        end else begin
            v6 <= v5;
            pix6 <= pix5;
            oc6 <= oc5;
            out_signed6 <= out_signed5;
            clamp5 <= clamp_byte(shifted5, out_signed5);
        end
    end

    always @(posedge i_clk) begin
        if (i_rst) begin
            o_valid <= 1'b0;
            o_pix_idx <= 2'd0;
            o_oc_idx <= 5'd0;
            o_data <= 8'd0;
        end else begin
            o_valid <= v6;
            o_pix_idx <= pix6;
            o_oc_idx <= oc6;
            o_data <= clamp5;
        end
    end
endmodule
