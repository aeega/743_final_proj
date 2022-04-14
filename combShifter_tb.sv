/*
    Test bench for the Combinational Shifter
*/

// Timescale
`timescale 1ns / 1ps

module combShifter_tb;
    // Inputs
    bit [0:7] Ip;
    bit [0:4]shift_mag;
    
    // Outputs
    bit [0:7] Op;

    
    // Instantiate the Module Under Test
    combShifter mut(.Ip(Ip), .Op(Op), .shift_mag(shift_mag));
    
    //initial begin
        //$monitor("and_out %b",mut.and_out_msb); 
    //end
    initial begin
        // Initialize the input parameters
        //LEN = 8;
        //wa = 0;
    
        // Initialize the inputs
        Ip = 8'b0000_0000;
        shift_mag = 5'b00000; // no shift
        #10
        shift_mag = 5'b00100; // no shift
        #100
    
        Ip = 8'b0000_0001;
        #5
        shift_mag = 5'b00010; // Op to left shift by 1
        #100
   
        Ip = 8'b0000_0010;
        #20
        
        Ip = 8'b1010_1101;
        shift_mag = 5'b00001; // Op to left shift by 2
        #20
        shift_mag = 5'b10000; // Op to right shift by 2
        #20
        shift_mag = 5'b00100; // Op to no shift
        #100
        
        
        $finish;
    
    end

endmodule
