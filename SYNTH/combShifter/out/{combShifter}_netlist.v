/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Apr 25 16:13:57 2022
/////////////////////////////////////////////////////////////


module combShifter ( Ip, Op, shift_mag );
  input [0:2] Ip;
  output [0:2] Op;
  input [0:4] shift_mag;
  wire   n9, n10, n11, n12, n13;

  INV_X1 U10 ( .A(n9), .ZN(Op[2]) );
  AOI221_X1 U11 ( .B1(Ip[1]), .B2(shift_mag[1]), .C1(Ip[2]), .C2(shift_mag[2]), 
        .A(n10), .ZN(n9) );
  INV_X1 U12 ( .A(n11), .ZN(n10) );
  OAI21_X1 U13 ( .B1(shift_mag[0]), .B2(shift_mag[4]), .A(Ip[0]), .ZN(n11) );
  INV_X1 U14 ( .A(n12), .ZN(Op[0]) );
  AOI222_X1 U15 ( .A1(Ip[1]), .A2(shift_mag[3]), .B1(Ip[0]), .B2(shift_mag[2]), 
        .C1(Ip[2]), .C2(shift_mag[4]), .ZN(n12) );
  INV_X1 U16 ( .A(n13), .ZN(Op[1]) );
  AOI222_X1 U17 ( .A1(Ip[1]), .A2(shift_mag[2]), .B1(Ip[0]), .B2(shift_mag[1]), 
        .C1(Ip[2]), .C2(shift_mag[3]), .ZN(n13) );
endmodule

