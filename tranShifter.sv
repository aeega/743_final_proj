/*
====================================================================================================
   Transmission gate logic circuit based bi-directional shifter 
   Author:      Avinash Eega
   Date:        04/17/2022
   Description: A module acts as a base that is similar to mux logic with "n" inputs and outputs. 
                Uses this module to construct a shifter with any number of inputs.
                All the inputs and outputs are one-hot encoded
   Interpretation: 
                For example, MAX_SHIFT_MAG=2, then the shifts possible are -2, -1, 0, +1, +2
                shift_mag array would be a 2(2)+ 1 = 5 bit value.
               -------------------------------
               | shift_mag | Left shift value|
               -------------------------------
               | 5'b00000  |        0        |
               | 5'b10000  |       -2        |
               | 5'b01000  |       -1        |
               | 5'b00100  |        0        |
               | 5'b00010  |       +1        |
               | 5'b00001  |       +2        |
               -------------------------------
               Ip and Op are the inputs and outputs, each of length LEN. 
               For example, LEN = 8 -> Ip[7:0] and Op[7:0]
               Ip[0:7] = 8'b0000_0010 is a spike at time stamp t=1
               Ip[0:7] = 8'b0100_0000 is a spike at time stamp t=6

               The code logic also supports a union of spikes encoded within an input Ip.
               Example: 
               Ip[0:7] = 8'b0110_0011 has spikes at t=0,1, 5 and 6. 

               The output(Op) is of the same length as of the Ip and is a shifted version of the
               Input spike by the magnitude provided.

====================================================================================================
*/

module tranShifter( Ip, Op, shift_mag);        
    parameter LEN = 8;
    parameter MAX_SHIFT_MAG = 2;
    parameter WRAP_AROUND = 1;

    input bit [0:LEN-1] Ip; //The LEN-bit Input line 
    output bit [0:LEN-1] Op; //The LEN-bit Output line 
    input bit [0:(2*MAX_SHIFT_MAG)] shift_mag; //The shift magnitude Input line
    wire logic [0:LEN-1][0:(2*MAX_SHIFT_MAG)]and_out_msb;


    genvar i, j;
    
    generate
        for(j=0; j<LEN; j=j+1) begin //{ Index

        // Base block logic
            for(i=0; i<(2*MAX_SHIFT_MAG+1); i=i+1) begin //{
                // With wrap around 
                if(WRAP_AROUND) begin 
                    if((j-MAX_SHIFT_MAG+i) < 0) 
                        cmos tgate(and_out_msb[j][i], Ip[j-MAX_SHIFT_MAG+i+LEN], shift_mag[i], ~shift_mag[i]);         
                    else if((j-MAX_SHIFT_MAG+i) >= LEN) 
                        cmos tgate(and_out_msb[j][i], Ip[j-MAX_SHIFT_MAG+i-LEN], shift_mag[i], ~shift_mag[i]);  
                    else
                        cmos tgate(and_out_msb[j][i], Ip[j-MAX_SHIFT_MAG+i], shift_mag[i], ~shift_mag[i]);  
                 
                // No wrap around 
                end else begin
                   if((j-MAX_SHIFT_MAG+i) >= 0)
                        cmos tgate(and_out_msb[j][i], Ip[j-MAX_SHIFT_MAG+i], shift_mag[i], ~shift_mag[i]);
                   else
                        cmos tgate(and_out_msb[j][i], 1'b0, shift_mag[i], ~shift_mag[i]);
                end
            end //}
        
        assign Op[j] = |and_out_msb[j];


        end //}
    endgenerate

endmodule
