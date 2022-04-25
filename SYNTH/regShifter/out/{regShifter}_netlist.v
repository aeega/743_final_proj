/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Apr 25 17:37:45 2022
/////////////////////////////////////////////////////////////


module encoder_MAX_SHIFT_MAG3 ( binary_shift, one_hot_shift );
  output [3:0] binary_shift;
  input [0:6] one_hot_shift;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11;

  INV_X1 U3 ( .A(1'b1), .ZN(binary_shift[3]) );
  NAND3_X1 U5 ( .A1(n3), .A2(n4), .A3(n5), .ZN(binary_shift[2]) );
  NAND2_X1 U6 ( .A1(n4), .A2(n6), .ZN(binary_shift[1]) );
  OR3_X1 U7 ( .A1(one_hot_shift[4]), .A2(one_hot_shift[5]), .A3(n7), .ZN(n6)
         );
  AOI211_X1 U8 ( .C1(n8), .C2(n9), .A(one_hot_shift[2]), .B(one_hot_shift[3]), 
        .ZN(n7) );
  INV_X1 U9 ( .A(one_hot_shift[0]), .ZN(n9) );
  INV_X1 U10 ( .A(one_hot_shift[6]), .ZN(n4) );
  AOI21_X1 U11 ( .B1(n3), .B2(n10), .A(one_hot_shift[6]), .ZN(binary_shift[0])
         );
  OAI21_X1 U12 ( .B1(n11), .B2(one_hot_shift[3]), .A(n5), .ZN(n10) );
  INV_X1 U13 ( .A(one_hot_shift[4]), .ZN(n5) );
  AOI21_X1 U14 ( .B1(one_hot_shift[0]), .B2(n8), .A(one_hot_shift[2]), .ZN(n11) );
  INV_X1 U15 ( .A(one_hot_shift[1]), .ZN(n8) );
  INV_X1 U16 ( .A(one_hot_shift[5]), .ZN(n3) );
endmodule


module regShifter ( Ip, Op, shift_mag, clock );
  input [0:3] Ip;
  output [0:3] Op;
  input [0:6] shift_mag;
  input clock;
  wire   N20, N21, N22, N23, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77;
  wire   [3:0] value;

  encoder_MAX_SHIFT_MAG3 OneHot_2_binary ( .binary_shift(value), 
        .one_hot_shift(shift_mag) );
  DFF_X1 Op_reg_0_ ( .D(N23), .CK(clock), .Q(Op[0]) );
  DFF_X1 Op_reg_1_ ( .D(N22), .CK(clock), .Q(Op[1]) );
  DFF_X1 Op_reg_2_ ( .D(N21), .CK(clock), .Q(Op[2]) );
  DFF_X1 Op_reg_3_ ( .D(N20), .CK(clock), .Q(Op[3]) );
  OAI22_X1 U37 ( .A1(value[0]), .A2(value[2]), .B1(value[1]), .B2(value[2]), 
        .ZN(n72) );
  NOR2_X1 U38 ( .A1(n75), .A2(value[2]), .ZN(N20) );
  NAND3_X1 U39 ( .A1(value[1]), .A2(value[0]), .A3(value[2]), .ZN(n47) );
  OAI21_X1 U40 ( .B1(n48), .B2(n49), .A(n50), .ZN(N23) );
  NAND4_X1 U41 ( .A1(Ip[0]), .A2(n47), .A3(value[0]), .A4(n51), .ZN(n50) );
  NOR2_X1 U42 ( .A1(n52), .A2(n53), .ZN(n48) );
  MUX2_X1 U43 ( .A(n54), .B(n55), .S(n56), .Z(n53) );
  NOR2_X1 U44 ( .A1(n51), .A2(n57), .ZN(n55) );
  INV_X1 U45 ( .A(n58), .ZN(n52) );
  OAI21_X1 U46 ( .B1(value[0]), .B2(n59), .A(n60), .ZN(N22) );
  MUX2_X1 U47 ( .A(n61), .B(n62), .S(n51), .Z(n60) );
  NAND2_X1 U48 ( .A1(n47), .A2(n63), .ZN(n62) );
  OAI22_X1 U49 ( .A1(n56), .A2(n64), .B1(n65), .B2(n66), .ZN(n63) );
  NAND3_X1 U50 ( .A1(Ip[3]), .A2(value[0]), .A3(n67), .ZN(n61) );
  INV_X1 U51 ( .A(n68), .ZN(n59) );
  OAI21_X1 U52 ( .B1(n66), .B2(n58), .A(n69), .ZN(N21) );
  MUX2_X1 U53 ( .A(n70), .B(n71), .S(n56), .Z(n69) );
  NAND3_X1 U54 ( .A1(Ip[3]), .A2(n51), .A3(n67), .ZN(n71) );
  INV_X1 U55 ( .A(n49), .ZN(n67) );
  AOI21_X1 U56 ( .B1(n72), .B2(Ip[0]), .A(n68), .ZN(n70) );
  NOR3_X1 U57 ( .A1(n73), .A2(n54), .A3(n49), .ZN(n68) );
  NAND2_X1 U58 ( .A1(n47), .A2(n66), .ZN(n49) );
  NOR2_X1 U59 ( .A1(n73), .A2(n51), .ZN(n54) );
  NAND3_X1 U60 ( .A1(n51), .A2(n56), .A3(Ip[1]), .ZN(n58) );
  XNOR2_X1 U61 ( .A(n74), .B(value[1]), .ZN(n51) );
  NAND2_X1 U62 ( .A1(n56), .A2(n66), .ZN(n74) );
  INV_X1 U63 ( .A(n72), .ZN(n66) );
  MUX2_X1 U64 ( .A(n76), .B(n77), .S(value[1]), .Z(n75) );
  MUX2_X1 U65 ( .A(n57), .B(n73), .S(n56), .Z(n77) );
  INV_X1 U66 ( .A(Ip[2]), .ZN(n73) );
  INV_X1 U67 ( .A(Ip[3]), .ZN(n57) );
  MUX2_X1 U68 ( .A(n64), .B(n65), .S(n56), .Z(n76) );
  INV_X1 U69 ( .A(value[0]), .ZN(n56) );
  INV_X1 U70 ( .A(Ip[0]), .ZN(n65) );
  INV_X1 U71 ( .A(Ip[1]), .ZN(n64) );
endmodule

