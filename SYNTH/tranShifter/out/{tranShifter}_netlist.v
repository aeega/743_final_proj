/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Apr 19 15:20:16 2022
/////////////////////////////////////////////////////////////


module tranShifter ( Ip, Op, shift_mag );
  input [0:2] Ip;
  output [0:2] Op;
  input [0:4] shift_mag;
  wire   n4, n5, n6;
  tri   [0:2] Ip;
  tri   [0:4] shift_mag;
  tri   [14:0] and_out_msb_or;

  custom_tgate genblk1_0__genblk1_0__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[14]), .p2(shift_mag[0]), .p3(Ip[1]) );
  custom_tgate genblk1_0__genblk1_1__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[13]), .p2(shift_mag[1]), .p3(Ip[2]) );
  custom_tgate genblk1_0__genblk1_2__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[12]), .p2(shift_mag[2]), .p3(Ip[0]) );
  custom_tgate genblk1_0__genblk1_3__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[11]), .p2(shift_mag[3]), .p3(Ip[1]) );
  custom_tgate genblk1_0__genblk1_4__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[10]), .p2(shift_mag[4]), .p3(Ip[2]) );
  custom_tgate genblk1_1__genblk1_0__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[9]), .p2(shift_mag[0]), .p3(Ip[2]) );
  custom_tgate genblk1_1__genblk1_1__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[8]), .p2(shift_mag[1]), .p3(Ip[0]) );
  custom_tgate genblk1_1__genblk1_2__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[7]), .p2(shift_mag[2]), .p3(Ip[1]) );
  custom_tgate genblk1_1__genblk1_3__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[6]), .p2(shift_mag[3]), .p3(Ip[2]) );
  custom_tgate genblk1_1__genblk1_4__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[5]), .p2(shift_mag[4]), .p3(Ip[0]) );
  custom_tgate genblk1_2__genblk1_0__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[4]), .p2(shift_mag[0]), .p3(Ip[0]) );
  custom_tgate genblk1_2__genblk1_1__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[3]), .p2(shift_mag[1]), .p3(Ip[1]) );
  custom_tgate genblk1_2__genblk1_2__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[2]), .p2(shift_mag[2]), .p3(Ip[2]) );
  custom_tgate genblk1_2__genblk1_3__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[1]), .p2(shift_mag[3]), .p3(Ip[0]) );
  custom_tgate genblk1_2__genblk1_4__genblk1_genblk1_genblk1_tgate ( .p1(
        and_out_msb_or[0]), .p2(shift_mag[4]), .p3(Ip[1]) );
  OR3_X1 U7 ( .A1(and_out_msb_or[3]), .A2(and_out_msb_or[4]), .A3(n4), .ZN(
        Op[2]) );
  OR3_X1 U8 ( .A1(and_out_msb_or[0]), .A2(and_out_msb_or[1]), .A3(
        and_out_msb_or[2]), .ZN(n4) );
  OR3_X1 U9 ( .A1(and_out_msb_or[8]), .A2(and_out_msb_or[9]), .A3(n5), .ZN(
        Op[1]) );
  OR3_X1 U10 ( .A1(and_out_msb_or[5]), .A2(and_out_msb_or[6]), .A3(
        and_out_msb_or[7]), .ZN(n5) );
  OR3_X1 U11 ( .A1(and_out_msb_or[13]), .A2(and_out_msb_or[14]), .A3(n6), .ZN(
        Op[0]) );
  OR3_X1 U12 ( .A1(and_out_msb_or[10]), .A2(and_out_msb_or[11]), .A3(
        and_out_msb_or[12]), .ZN(n6) );
endmodule

