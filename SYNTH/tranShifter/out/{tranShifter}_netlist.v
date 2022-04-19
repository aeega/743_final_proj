/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Apr 19 04:45:01 2022
/////////////////////////////////////////////////////////////


module tranShifter ( Ip, Op, shift_mag );
  input [0:1] Ip;
  output [0:1] Op;
  input [0:2] shift_mag;

  tri   [0:1] Ip;
  tri   [0:2] shift_mag;
  tri   [5:0] and_out_msb;

  custom_tgate genblk1_0__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[5]), .p2(shift_mag[0]), .p3(Ip[1]) );
  custom_tgate genblk1_0__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[4]), .p2(shift_mag[1]), .p3(Ip[0]) );
  custom_tgate genblk1_0__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[3]), .p2(shift_mag[2]), .p3(Ip[1]) );
  custom_tgate genblk1_1__genblk1_0__genblk1_genblk1_tgate ( .p1(
        and_out_msb[2]), .p2(shift_mag[0]), .p3(Ip[0]) );
  custom_tgate genblk1_1__genblk1_1__genblk1_genblk1_tgate ( .p1(
        and_out_msb[1]), .p2(shift_mag[1]), .p3(Ip[1]) );
  custom_tgate genblk1_1__genblk1_2__genblk1_genblk1_tgate ( .p1(
        and_out_msb[0]), .p2(shift_mag[2]), .p3(Ip[0]) );
  OR3_X1 U3 ( .A1(and_out_msb[0]), .A2(and_out_msb[1]), .A3(and_out_msb[2]), 
        .ZN(Op[1]) );
  OR3_X1 U4 ( .A1(and_out_msb[3]), .A2(and_out_msb[4]), .A3(and_out_msb[5]), 
        .ZN(Op[0]) );
endmodule

