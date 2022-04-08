/*
====================================================================================================
   Combinatory logic circuit based bi-directional shifter 
   Author:      Avinash Eega
   Date:        03/30/2022
   Description: A module acts as a base that is similar to mux logic with "n" inputs and outputs. 
                Uses this module to construct a shifter with any number of inputs.
====================================================================================================
*/

module combShifter( Ip, Op);        
    parameter LEN = 8;
    parameter MAX_SHIFT_MAG = 2;

    input  [0:LEN-1] Ip; //The LEN-bit Input line 
    output [0:LEN-1] Op; //The LEN-bit Output line 
    wire [0:(2*MAX_SHIFT_MAG)] shift_mag; //The LEN shift magnitude selection Input
    genvar i;
    //Use baseBlock to get the output
    generate
        for(i=0; i<LEN; i++) begin
            baseBlock B1(Ip, i, Op_bit[i]);
        end
    endgenerate

endmodule
