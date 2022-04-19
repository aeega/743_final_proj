/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Apr 19 01:38:19 2022
/////////////////////////////////////////////////////////////


module combShifter ( Ip, Op, shift_mag );
  input [0:7] Ip;
  output [0:7] Op;
  input [0:4] shift_mag;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37;

  OAI221_X1 U28 ( .B1(n20), .B2(n21), .C1(n22), .C2(n23), .A(n24), .ZN(Op[7])
         );
  AOI222_X1 U29 ( .A1(shift_mag[0]), .A2(Ip[5]), .B1(shift_mag[3]), .B2(Ip[0]), 
        .C1(shift_mag[4]), .C2(Ip[1]), .ZN(n24) );
  INV_X1 U30 ( .A(shift_mag[1]), .ZN(n21) );
  OAI221_X1 U31 ( .B1(n20), .B2(n23), .C1(n25), .C2(n22), .A(n26), .ZN(Op[6])
         );
  AOI222_X1 U32 ( .A1(shift_mag[1]), .A2(Ip[5]), .B1(shift_mag[4]), .B2(Ip[0]), 
        .C1(Ip[4]), .C2(shift_mag[0]), .ZN(n26) );
  INV_X1 U33 ( .A(shift_mag[2]), .ZN(n23) );
  OAI221_X1 U34 ( .B1(n25), .B2(n20), .C1(n27), .C2(n22), .A(n28), .ZN(Op[5])
         );
  AOI222_X1 U35 ( .A1(shift_mag[2]), .A2(Ip[5]), .B1(Ip[3]), .B2(shift_mag[0]), 
        .C1(Ip[4]), .C2(shift_mag[1]), .ZN(n28) );
  INV_X1 U36 ( .A(Ip[7]), .ZN(n22) );
  OAI221_X1 U37 ( .B1(n25), .B2(n29), .C1(n27), .C2(n20), .A(n30), .ZN(Op[4])
         );
  AOI222_X1 U38 ( .A1(Ip[4]), .A2(shift_mag[2]), .B1(Ip[2]), .B2(shift_mag[0]), 
        .C1(Ip[3]), .C2(shift_mag[1]), .ZN(n30) );
  INV_X1 U39 ( .A(Ip[6]), .ZN(n20) );
  OAI221_X1 U40 ( .B1(n25), .B2(n31), .C1(n27), .C2(n29), .A(n32), .ZN(Op[3])
         );
  AOI222_X1 U41 ( .A1(Ip[3]), .A2(shift_mag[2]), .B1(shift_mag[0]), .B2(Ip[1]), 
        .C1(Ip[2]), .C2(shift_mag[1]), .ZN(n32) );
  INV_X1 U42 ( .A(Ip[5]), .ZN(n29) );
  OAI221_X1 U43 ( .B1(n25), .B2(n33), .C1(n27), .C2(n31), .A(n34), .ZN(Op[2])
         );
  AOI222_X1 U44 ( .A1(Ip[2]), .A2(shift_mag[2]), .B1(shift_mag[0]), .B2(Ip[0]), 
        .C1(shift_mag[1]), .C2(Ip[1]), .ZN(n34) );
  INV_X1 U45 ( .A(Ip[4]), .ZN(n31) );
  OAI221_X1 U46 ( .B1(n25), .B2(n35), .C1(n27), .C2(n33), .A(n36), .ZN(Op[1])
         );
  AOI22_X1 U47 ( .A1(shift_mag[1]), .A2(Ip[0]), .B1(shift_mag[2]), .B2(Ip[1]), 
        .ZN(n36) );
  INV_X1 U48 ( .A(Ip[3]), .ZN(n33) );
  INV_X1 U49 ( .A(shift_mag[4]), .ZN(n27) );
  INV_X1 U50 ( .A(Ip[2]), .ZN(n35) );
  INV_X1 U51 ( .A(shift_mag[3]), .ZN(n25) );
  INV_X1 U52 ( .A(n37), .ZN(Op[0]) );
  AOI222_X1 U53 ( .A1(shift_mag[3]), .A2(Ip[1]), .B1(Ip[0]), .B2(shift_mag[2]), 
        .C1(shift_mag[4]), .C2(Ip[2]), .ZN(n37) );
endmodule

