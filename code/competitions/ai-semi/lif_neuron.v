`timescale 1ns / 1ps

module lif_neuron
    #(parameter WU=16,
    parameter WX=16,
    parameter signed [WU-1:0] LEAK    = 16'sd10,
    parameter signed [WU-1:0] U_THR   = 16'sd2000,
    parameter signed [WX-1:0] W_GAIN  = 16'sd1,
    parameter signed [WU-1:0] K_V     = 16'sd20
   )
  (
    input                     clk,
    input                     rstn,
    input  signed [WX-1:0]    X_in,
    input  signed [WU-1:0]    v_abs,
    output reg                spike
  );

  reg signed [WU-1:0] U;

  always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
      U     <= 0;
      spike <= 1'b0;
    end else begin
      spike <= (U > U_THR);

      if (U < LEAK) begin
        U <= 0;
      end else begin
        U <= U - LEAK
             + ( W_GAIN * X_in )
             - ( (U > U_THR) ? U_THR : 0 )
             - ( K_V * v_abs );
      end
    end
  end
endmodule
