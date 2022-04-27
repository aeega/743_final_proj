/*
====================================================================================================
   Register logic based bi-directional shifter 
   Author:      Tanmayi Parab
   Date:        04/01/2022
   Description: The module is based on traditional bi-directional shifter build on registers. 
                It can construct a register shifter with any number of inputs with varying shifts.
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

module regShifter( Ip, Op, shift_mag, clock);        
    parameter LEN = 1;
    parameter MAX_SHIFT_MAG = 0;
    parameter WRAP_AROUND = 0;
    parameter SHIFT_AS_ONE_HOT = 1;


    input bit [0:LEN-1] Ip; //The LEN-bit Input line 
    output bit [0:LEN-1] Op; //The LEN-bit Output line 
    input bit [0:(2*MAX_SHIFT_MAG)] shift_mag; //The shift magnitude Input line
    input logic clock; 

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

    assign temp = {Ip,Ip} << shift_value;

    always @(posedge clock) begin
        if (WRAP_AROUND) begin
            if(sign) begin
                Op <= ({Ip,Ip} >> shift_value); // left shift with wrap around
            end
            else begin
                Op <= temp[2*LEN-1:LEN];  // right shift with wrap around
            end
        end
        else begin
            if(sign) begin
                Op <= Ip >> shift_value;
            end
            else begin
                Op <= Ip << shift_value;
            end
        end
    end

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
