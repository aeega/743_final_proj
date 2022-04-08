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
    wire [0:(2*MAX_SHIFT_MAG)]and_out_msb;
    genvar i, j;
    
    generate
        for(j=0; j<LEN; j++) begin //{ Index

        // Base block logic
            for(i=0; i<(2*MAX_SHIFT_MAG+1); i++) begin //{
                // No WA
                if((j-MAX_SHIFT_MAG+i) < 0) begin//{
                //if((MAX_SHIFT_MAG+i) < 0) begin
                    assign and_out_msb[i] = 0;
                end else if(j-MAX_SHIFT_MAG+i > LEN-1) begin 
                //end else if(MAX_SHIFT_MAG+i > LEN-1) begin 
                    assign and_out_msb[i] = 0;
                // Actual AND output
                end else begin 
                    assign and_out_msb[i] = Ip[j-MAX_SHIFT_MAG+i] & shift_mag[i];
                end //}
            end //}
        
        assign Op[j] = |and_out_msb;


        end //}
    endgenerate

endmodule
