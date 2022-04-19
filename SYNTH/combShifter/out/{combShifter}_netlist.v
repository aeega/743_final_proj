/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Apr 19 04:44:57 2022
/////////////////////////////////////////////////////////////


module combShifter ( Ip, Op, shift_mag );
  input [0:1] Ip;
  output [0:1] Op;
  input [0:2] shift_mag;
  wire   n6, n7, n8;

  INV_X1 U7 ( .A(n6), .ZN(Op[1]) );
  AOI22_X1 U8 ( .A1(Ip[1]), .A2(shift_mag[1]), .B1(n7), .B2(Ip[0]), .ZN(n6) );
  OR2_X1 U9 ( .A1(shift_mag[0]), .A2(shift_mag[2]), .ZN(n7) );
  INV_X1 U10 ( .A(n8), .ZN(Op[0]) );
  AOI22_X1 U11 ( .A1(Ip[1]), .A2(shift_mag[2]), .B1(Ip[0]), .B2(shift_mag[1]), 
        .ZN(n8) );
endmodule

