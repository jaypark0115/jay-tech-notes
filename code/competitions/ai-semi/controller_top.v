`timescale 1ns / 1ps

module controller_top
#(parameter W_POS=16)
  (
    input  clk,
    input  rstn,
    input  signed [W_POS-1:0] pos_x,
    input  signed [W_POS-1:0] pos_y,
    input  signed [W_POS-1:0] v_abs_x,
    input  signed [W_POS-1:0] v_abs_y,
    output motor_X_PULL,
    output motor_X_PUSH,
    output motor_Y_PULL,
    output motor_Y_PUSH
  );

  wire signed [W_POS-1:0] X_in [0:3];
  wire spikes [0:3];
  wire signed [W_POS-1:0] v_abs [0:3] = {v_abs_x, v_abs_x, v_abs_y, v_abs_y};

  error_encoder #(.W_IN(W_POS)) u_encoder (
    .x(pos_x), .y(pos_y),
    .X_x_pull(X_in[0]), .X_x_push(X_in[1]),
    .X_y_pull(X_in[2]), .X_y_push(X_in[3])
  );

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : SNN_CHANNEL
      // LIF 뉴런 인스턴스
      lif_neuron #(
        .WU(W_POS), .WX(W_POS)
      ) u_lif (
        .clk(clk), .rstn(rstn),
        .X_in(X_in[i]),
        .v_abs(v_abs[i]),
        .spike(spikes[i])
      );
    end
  endgenerate

  // 최종 모터 출력을 뉴런의 스파이크 출력에 직접 연결
  assign motor_X_PULL = spikes[0];
  assign motor_X_PUSH = spikes[1];
  assign motor_Y_PULL = spikes[2];
  assign motor_Y_PUSH = spikes[3];

endmodule