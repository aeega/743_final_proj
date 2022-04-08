/*
Base block implementation
*/

module baseBlock(Ip, index, Op_bit);
    genvar i;
    parameter LEN = 8;
    parameter MAX_SHIFT_MAG = 2;

    input logic [0:LEN-1] Ip;
    input index;
    output logic Op_bit;
    wire logic or_out;
    wire logic [0:(2*MAX_SHIFT_MAG)] shift_mag;
    wire logic [0:(2*MAX_SHIFT_MAG)]and_out_msb;
    
    for(i=0; i<(2*MAX_SHIFT_MAG+1); i=i+1) begin
        // No WA
        if((index-MAX_SHIFT_MAG+i) < 0) begin
        //if((MAX_SHIFT_MAG+i) < 0) begin
            assign and_out_msb[i] = 0;
        //end else if(index-MAX_SHIFT_MAG+i > LEN-1) begin 
        end else if(MAX_SHIFT_MAG+i > LEN-1) begin 
            assign and_out_msb[i] = 0;
        // Actual AND output
        end else begin 
            assign and_out_msb[i] = Ip[index-MAX_SHIFT_MAG+i] & shift_mag[i];
        end
    end

    assign Op_bit = |and_out_msb;
endmodule: baseBlock
