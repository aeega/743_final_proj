/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Apr 25 18:11:09 2022
/////////////////////////////////////////////////////////////


module encoder_MAX_SHIFT_MAG1_SHIFT_AS_ONE_HOT0 ( binary_shift, one_hot_shift
 );
  output [1:0] binary_shift;
  input [0:2] one_hot_shift;


  BUF_X1 U1 ( .A(one_hot_shift[2]), .Z(binary_shift[0]) );
  BUF_X1 U2 ( .A(one_hot_shift[1]), .Z(binary_shift[1]) );
endmodule


module MUX2_1 ( Y, sel, A, B );
  input sel, A, B;
  output Y;


  MUX2_X1 U1 ( .A(A), .B(B), .S(sel), .Z(Y) );
endmodule


module MUX2_0 ( Y, sel, A, B );
  input sel, A, B;
  output Y;


  MUX2_X1 U1 ( .A(A), .B(B), .S(sel), .Z(Y) );
endmodule


module barrelShifter ( Ip, Op, shift_mag );
  input [0:1] Ip;
  output [0:1] Op;
  input [0:2] shift_mag;
  wire   n_1_net_, n_2_net_, n8;
  wire   [1:0] value;

  encoder_MAX_SHIFT_MAG1_SHIFT_AS_ONE_HOT0 OneHot_2_binary ( .binary_shift(
        value), .one_hot_shift(shift_mag) );
  MUX2_1 genblk1_layer_1_0__m1_layer ( .Y(Op[0]), .sel(n8), .A(n_1_net_), .B(
        Ip[0]) );
  MUX2_0 genblk1_layer_1_1__m1_layer ( .Y(Op[1]), .sel(n8), .A(Ip[1]), .B(
        n_2_net_) );
  NOR2_X1 U8 ( .A1(value[1]), .A2(value[0]), .ZN(n8) );
  MUX2_X1 U9 ( .A(Ip[0]), .B(Ip[1]), .S(value[0]), .Z(n_2_net_) );
  MUX2_X1 U10 ( .A(Ip[1]), .B(Ip[0]), .S(value[0]), .Z(n_1_net_) );
endmodule

