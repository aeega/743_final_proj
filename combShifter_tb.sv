/*
    Test bench for the Combinational Shifter
*/

// Timescale
`timescale 1ns / 1ps

module combShifter_tb;
    // Inputs
    parameter MAX_SHIFT_MAG, wa, LEN;
    reg[0:LEN-1] Ip;
    // Outputs
    wire[0:LEN-1] Op;
    
    // Instantiate the Module Under Test
    combShifter mut(.Ip(Ip), .Op(Op), .MAX_SHIFT_MAG(MAX_SHIFT_MAG), .wa(wa), .LEN(LEN));
    
    initial begin
        // Initialize the input parameters
        LEN = 8;
        wa = 0;
        MAX_SHIFT_MAG = 2;
    
        // Initialize the inputs
        Ip = 8'b0000_0000;
        // Wait for 100 ns
        #100
    
        Ip = 8'b0000_0001;
        #20
        $sformat("TB_DEBUG_PRINTS","Ip is %b", Ip);

   
        Ip = 8'b0000_0010;
        #20
    
        Ip = 8'b0000_0100;
        #20
    
    end

endmodule
