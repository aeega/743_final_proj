/*
====================================================================================================
   Mux based bi-directional Barrel shifter 
   Author:      Tanmayi Parab
   Date:        04/01/2022
   Description: The module is based on traditional bi-directional barrel shifter build using Muxes. 
                It can construct a barrel shifter with any number of inputs with varying shifts.
                The inputs and outputs are thermometer encoded
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

module barrelShifter( Ip, Op, shift_mag);        
    parameter LEN = 1;
    parameter MAX_SHIFT_MAG = 0;
    parameter WRAP_AROUND = 0;
    parameter SHIFT_AS_ONE_HOT = 1;

    input bit [0:LEN-1] Ip; //The LEN-bit Input line 
    output bit [0:LEN-1] Op; //The LEN-bit Output line 
    input bit [0:(2*MAX_SHIFT_MAG)] shift_mag; //The shift magnitude Input line

    genvar i;

    bit sign;
    logic [$clog2(2*MAX_SHIFT_MAG):0] shift_binary, shift_value;
    logic [(2*LEN)-1:0] temp;


    if (SHIFT_AS_ONE_HOT) begin
        encoder #(.MAX_SHIFT_MAG(MAX_SHIFT_MAG)) OneHot_2_binary (.binary_shift(shift_binary), .one_hot_shift(shift_mag));
    end
    else begin
        assign shift_binary = (shift_mag[$clog2(2*MAX_SHIFT_MAG):2*MAX_SHIFT_MAG]) ;
    end

    assign sign = shift_binary < MAX_SHIFT_MAG;
    assign shift_value = sign ? (MAX_SHIFT_MAG - shift_binary) : (shift_binary - MAX_SHIFT_MAG) ;
  
    assign temp = {Ip,Ip};

    generate
    if(WRAP_AROUND) begin
        for (i = 0; i < LEN ; i = i + 1)
        begin: layer_1

            MUX2 m1_layer(.Y(Op[LEN-i-1]), .B(temp[i+shift_value]), .A(temp[i-shift_value+LEN]), .sel(sign));

        end
    end 
    else begin
        for (i = 0; i < LEN ; i = i + 1)
        begin: layer_1
        
            MUX2 m1_layer(.Y(Op[i]), .B(Ip[i-shift_value]), .A(Ip[i+shift_value]), .sel(sign));
            
        end
    end
    endgenerate

endmodule


module MUX2(
    output logic Y,
    input logic sel, A, B
);

    assign Y = sel ? B : A;

endmodule


// Encoder to covert one-hot encoding to binary encoding
module encoder #(parameter MAX_SHIFT_MAG = 0)(
    output logic [$clog2(2*MAX_SHIFT_MAG):0] binary_shift,
    input logic [0:(2*MAX_SHIFT_MAG)] one_hot_shift
);

    logic [MAX_SHIFT_MAG:0] i;

    always_comb begin

        binary_shift  = MAX_SHIFT_MAG;

        for ( i=0; i<= 2*MAX_SHIFT_MAG ; i = i+1 ) 
            if (one_hot_shift[i]) begin
               binary_shift= i;
        end

    end
  
endmodule
