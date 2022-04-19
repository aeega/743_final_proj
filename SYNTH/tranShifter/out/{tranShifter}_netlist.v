/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Apr 19 01:47:38 2022
/////////////////////////////////////////////////////////////


module tranShifter ( Ip, Op, shift_mag );
  input [0:7] Ip;
  output [0:7] Op;
  input [0:4] shift_mag;
  wire   n9, n10, n11, n12, n13, n14, n15, n16;
  tri   [0:7] Ip;
  tri   [0:4] shift_mag;
  tri   [39:0] and_out_msb;

  custom_tgate genblk1_0__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[39]), .p2(shift_mag[0]), .p3(Ip[6]) );
  custom_tgate genblk1_0__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[38]), .p2(shift_mag[1]), .p3(Ip[7]) );
  custom_tgate genblk1_0__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[37]), .p2(shift_mag[2]), .p3(Ip[0]) );
  custom_tgate genblk1_0__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[36]), .p2(shift_mag[3]), .p3(Ip[1]) );
  custom_tgate genblk1_0__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[35]), .p2(shift_mag[4]), .p3(Ip[2]) );
  custom_tgate genblk1_1__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[34]), .p2(shift_mag[0]), .p3(Ip[7]) );
  custom_tgate genblk1_1__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[33]), .p2(shift_mag[1]), .p3(Ip[0]) );
  custom_tgate genblk1_1__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[32]), .p2(shift_mag[2]), .p3(Ip[1]) );
  custom_tgate genblk1_1__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[31]), .p2(shift_mag[3]), .p3(Ip[2]) );
  custom_tgate genblk1_1__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[30]), .p2(shift_mag[4]), .p3(Ip[3]) );
  custom_tgate genblk1_2__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[29]), .p2(shift_mag[0]), .p3(Ip[0]) );
  custom_tgate genblk1_2__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[28]), .p2(shift_mag[1]), .p3(Ip[1]) );
  custom_tgate genblk1_2__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[27]), .p2(shift_mag[2]), .p3(Ip[2]) );
  custom_tgate genblk1_2__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[26]), .p2(shift_mag[3]), .p3(Ip[3]) );
  custom_tgate genblk1_2__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[25]), .p2(shift_mag[4]), .p3(Ip[4]) );
  custom_tgate genblk1_3__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[24]), .p2(shift_mag[0]), .p3(Ip[1]) );
  custom_tgate genblk1_3__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[23]), .p2(shift_mag[1]), .p3(Ip[2]) );
  custom_tgate genblk1_3__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[22]), .p2(shift_mag[2]), .p3(Ip[3]) );
  custom_tgate genblk1_3__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[21]), .p2(shift_mag[3]), .p3(Ip[4]) );
  custom_tgate genblk1_3__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[20]), .p2(shift_mag[4]), .p3(Ip[5]) );
  custom_tgate genblk1_4__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[19]), .p2(shift_mag[0]), .p3(Ip[2]) );
  custom_tgate genblk1_4__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[18]), .p2(shift_mag[1]), .p3(Ip[3]) );
  custom_tgate genblk1_4__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[17]), .p2(shift_mag[2]), .p3(Ip[4]) );
  custom_tgate genblk1_4__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[16]), .p2(shift_mag[3]), .p3(Ip[5]) );
  custom_tgate genblk1_4__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[15]), .p2(shift_mag[4]), .p3(Ip[6]) );
  custom_tgate genblk1_5__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[14]), .p2(shift_mag[0]), .p3(Ip[3]) );
  custom_tgate genblk1_5__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[13]), .p2(shift_mag[1]), .p3(Ip[4]) );
  custom_tgate genblk1_5__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[12]), .p2(shift_mag[2]), .p3(Ip[5]) );
  custom_tgate genblk1_5__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[11]), .p2(shift_mag[3]), .p3(Ip[6]) );
  custom_tgate genblk1_5__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[10]), .p2(shift_mag[4]), .p3(Ip[7]) );
  custom_tgate genblk1_6__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[9]), .p2(shift_mag[0]), .p3(Ip[4]) );
  custom_tgate genblk1_6__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[8]), .p2(shift_mag[1]), .p3(Ip[5]) );
  custom_tgate genblk1_6__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[7]), .p2(shift_mag[2]), .p3(Ip[6]) );
  custom_tgate genblk1_6__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[6]), .p2(shift_mag[3]), .p3(Ip[7]) );
  custom_tgate genblk1_6__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[5]), .p2(shift_mag[4]), .p3(Ip[0]) );
  custom_tgate genblk1_7__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[4]), .p2(shift_mag[0]), .p3(Ip[5]) );
  custom_tgate genblk1_7__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[3]), .p2(shift_mag[1]), .p3(Ip[6]) );
  custom_tgate genblk1_7__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[2]), .p2(shift_mag[2]), .p3(Ip[7]) );
  custom_tgate genblk1_7__genblk1_3__genblk1_genblk1_tgate ( .p1(
        and_out_msb[1]), .p2(shift_mag[3]), .p3(Ip[0]) );
  custom_tgate genblk1_7__genblk1_4__genblk1_genblk1_tgate ( .p1(
        and_out_msb[0]), .p2(shift_mag[4]), .p3(Ip[1]) );
  OR3_X1 U17 ( .A1(and_out_msb[3]), .A2(and_out_msb[4]), .A3(n9), .ZN(Op[7])
         );
  OR3_X1 U18 ( .A1(and_out_msb[0]), .A2(and_out_msb[1]), .A3(and_out_msb[2]), 
        .ZN(n9) );
  OR3_X1 U19 ( .A1(and_out_msb[8]), .A2(and_out_msb[9]), .A3(n10), .ZN(Op[6])
         );
  OR3_X1 U20 ( .A1(and_out_msb[5]), .A2(and_out_msb[6]), .A3(and_out_msb[7]), 
        .ZN(n10) );
  OR3_X1 U21 ( .A1(and_out_msb[13]), .A2(and_out_msb[14]), .A3(n11), .ZN(Op[5]) );
  OR3_X1 U22 ( .A1(and_out_msb[10]), .A2(and_out_msb[11]), .A3(and_out_msb[12]), .ZN(n11) );
  OR3_X1 U23 ( .A1(and_out_msb[18]), .A2(and_out_msb[19]), .A3(n12), .ZN(Op[4]) );
  OR3_X1 U24 ( .A1(and_out_msb[15]), .A2(and_out_msb[16]), .A3(and_out_msb[17]), .ZN(n12) );
  OR3_X1 U25 ( .A1(and_out_msb[23]), .A2(and_out_msb[24]), .A3(n13), .ZN(Op[3]) );
  OR3_X1 U26 ( .A1(and_out_msb[20]), .A2(and_out_msb[21]), .A3(and_out_msb[22]), .ZN(n13) );
  OR3_X1 U27 ( .A1(and_out_msb[28]), .A2(and_out_msb[29]), .A3(n14), .ZN(Op[2]) );
  OR3_X1 U28 ( .A1(and_out_msb[25]), .A2(and_out_msb[26]), .A3(and_out_msb[27]), .ZN(n14) );
  OR3_X1 U29 ( .A1(and_out_msb[33]), .A2(and_out_msb[34]), .A3(n15), .ZN(Op[1]) );
  OR3_X1 U30 ( .A1(and_out_msb[30]), .A2(and_out_msb[31]), .A3(and_out_msb[32]), .ZN(n15) );
  OR3_X1 U31 ( .A1(and_out_msb[38]), .A2(and_out_msb[39]), .A3(n16), .ZN(Op[0]) );
  OR3_X1 U32 ( .A1(and_out_msb[35]), .A2(and_out_msb[36]), .A3(and_out_msb[37]), .ZN(n16) );
endmodule

