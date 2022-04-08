/*
    Test bench for the Combinational Shifter
*/

// Timescale
`timescale 1ns / 1ps

module combShifter_tb;
    // Inputs
    reg[0:7] Ip;
    // Outputs
    wire[0:7] Op;
    
    // Instantiate the Module Under Test
    combShifter mut(.Ip(Ip), .Op(Op));
    
    initial begin
        // Initialize the input parameters
        //LEN = 8;
        //wa = 0;
    
        // Initialize the inputs
        Ip = 8'b0000_0000;
        // Wait for 100 ns
        #100
    
        Ip = 8'b0000_0001;
        #20
        $display("Ip is %b", Ip);
        $display("Op is %b", Op);

   
        Ip = 8'b0000_0010;
        #20
    
        Ip = 8'b0000_0100;
        #100
        $finish;
    
    end

endmodule
