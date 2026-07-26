`timescale 1ns / 1ps

module error_encoder
    #(parameter W_IN = 16,
    parameter ALPHA = 1)
  (
    input  signed [W_IN-1:0] x, y,
    output signed [W_IN-1:0] X_x_pull,
    output signed [W_IN-1:0] X_x_push,
    output signed [W_IN-1:0] X_y_pull,
    output signed [W_IN-1:0] X_y_push
  );

  wire signed [W_IN-1:0] ex = -x;
  wire signed [W_IN-1:0] ey = -y;

  assign X_x_pull = (ex > 0) ? (ALPHA * ex) : 0;
  assign X_x_push = (ex < 0) ? (ALPHA * (-ex)) : 0;
  assign X_y_pull = (ey > 0) ? (ALPHA * ey) : 0;
  assign X_y_push = (ey < 0) ? (ALPHA * (-ey)) : 0;

endmodule
