/*
====================================================================================================
   Mux based bi-directional Barrel shifter 
   Author:      Tanmayi Parab
   Date:        04/01/2022
   Description: The module is based on traditional bi-directional barrel shifter build using Muxes. 
                It can construct a barrel shifter with any number of inputs with varying shifts.
                All the inputs and outputs are thermometer encoded
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
module barrelShifter( Ip, Op, shift_mag);        
    parameter LEN = 2;
    parameter MAX_SHIFT_MAG = 1;
    parameter WRAP_AROUND = 0;
    parameter SHIFT_AS_ONE_HOT = 0;

    input bit [0:LEN-1] Ip; //The LEN-bit Input line 
    output bit [0:LEN-1] Op; //The LEN-bit Output line 
    input bit [0:(2*MAX_SHIFT_MAG)] shift_mag; //The shift magnitude Input line

    genvar i;

    bit sign;
    logic [$clog2(2*MAX_SHIFT_MAG):0] value, shift_value;
    logic [(2*LEN)-1:0] temp;
    
    encoder #(.MAX_SHIFT_MAG(MAX_SHIFT_MAG), .SHIFT_AS_ONE_HOT(SHIFT_AS_ONE_HOT)) OneHot_2_binary (.binary_shift(value), .one_hot_shift(shift_mag));


    assign sign = value < MAX_SHIFT_MAG;
    assign shift_value = sign ? (MAX_SHIFT_MAG - value) : (value - MAX_SHIFT_MAG) ;
  
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
module encoder #(parameter MAX_SHIFT_MAG = 0, parameter SHIFT_AS_ONE_HOT = 1)(
    output logic [$clog2(2*MAX_SHIFT_MAG):0] binary_shift,
    input logic [0:(2*MAX_SHIFT_MAG)] one_hot_shift
);
    // Actual encoder
    if(SHIFT_AS_ONE_HOT) begin //{
    
        logic [MAX_SHIFT_MAG:0] i;
    
        always_comb begin
    
            binary_shift  = MAX_SHIFT_MAG;
    
            for ( i=0; i<= 2*MAX_SHIFT_MAG ; i = i+1 ) 
                if (one_hot_shift[i]) begin
                   binary_shift= i;
            end
    
        end
    // Not functional    
    end else begin //{
        assign binary_shift = one_hot_shift;
    end//}
  
endmodule

