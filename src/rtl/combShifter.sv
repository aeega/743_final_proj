/*
====================================================================================================
   Combinatory logic circuit based bi-directional shifter 
   Author:      Avinash Eega
   Date:        03/30/2022
   Description: A module acts as a base that is similar to mux logic with "n" inputs and outputs. 
                Uses this module to construct a shifter with any number of inputs.
                The inputs and outputs are one-hot encoded
                The shift magnitudes can be represented in either on-hot encoding or binary encoding 
   Interpretation: 
                For One-hot Encoding, MAX_SHIFT_MAG=2, then the shifts possible are -2, -1, 0, +1, +2
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

               For Binary Encoding, MAX_SHIFT_MAG=2, then the shifts possible are -2, -1, 0, +1, +2
               shift_mag should vary from 1 to 5 binary value.
                -------------------------------
               | shift_mag | Left shift value|
               -------------------------------
               | 3'b000    |       -2        |
               | 3'b001    |       -1        |
               | 3'b010    |        0        |
               | 3'b011    |       +1        |
               | 3'b100    |       +2        |
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

module combShifter( Ip, Op, shift_mag);        
    parameter LEN = 1;
    parameter MAX_SHIFT_MAG = 0;
    parameter WRAP_AROUND = 0;
    parameter SHIFT_AS_ONE_HOT = 1;

    input bit [0:LEN-1] Ip; //The LEN-bit Input line 
    output bit [0:LEN-1] Op; //The LEN-bit Output line 
    input bit [0:(2*MAX_SHIFT_MAG)] shift_mag; //The shift magnitude Input line
    logic [0:LEN-1][0:(2*MAX_SHIFT_MAG)]and_out_msb;
    genvar i, j;

    logic [0:(2*MAX_SHIFT_MAG)] shift_oneHot;

    if(SHIFT_AS_ONE_HOT) begin 
        assign shift_oneHot = shift_mag;
    end
    else begin
        decoder #(.MAX_SHIFT_MAG(MAX_SHIFT_MAG)) binary_2_OneHot(.one_hot_shift(shift_oneHot), .binary_shift(shift_mag[$clog2(2*MAX_SHIFT_MAG):2*MAX_SHIFT_MAG]));
    end

    generate
        for(j=0; j<LEN; j=j+1) begin //{ Index

        // Base block logic
            for(i=0; i<(2*MAX_SHIFT_MAG+1); i=i+1) begin //{
                // With wrap around 
                if(WRAP_AROUND) begin 
                    assign and_out_msb[j][i] =  ((j-MAX_SHIFT_MAG+i) < 0) ? (Ip[j-MAX_SHIFT_MAG+i+LEN] & shift_oneHot[i]): // NOOBs
                                                ((j-MAX_SHIFT_MAG+i) >= LEN) ? (Ip[j-MAX_SHIFT_MAG+i-LEN] & shift_oneHot[i]): // POOBs
                                                (Ip[j-MAX_SHIFT_MAG+i] & shift_mag[i]); // WIBs
                // No wrap around 
                end else begin
                    assign and_out_msb[j][i] = ((j-MAX_SHIFT_MAG+i) >= 0) ? (Ip[j-MAX_SHIFT_MAG+i] & shift_oneHot[i]) : 1'b0;
                end
            end 
        
        assign Op[j] = |and_out_msb[j];

        end 
    endgenerate

endmodule

// Decoder to covert binary encoding to one-hot encoding
module decoder #(parameter MAX_SHIFT_MAG = 5)(
    output logic [0:(2*MAX_SHIFT_MAG)] one_hot_shift,
    input logic [$clog2(2*MAX_SHIFT_MAG):0] binary_shift
    
);

    logic [MAX_SHIFT_MAG:0] i;

    always_comb begin

        for ( i=0; i<= 2*MAX_SHIFT_MAG ; i = i+1 )  begin

            if (i == (binary_shift))
                one_hot_shift[i] = 1'b1;
            else
                one_hot_shift[i] = 1'b0;
        end

    end
  
endmodule
