module test_shifter;
	
    parameter SHIFT_AS_ONE_HOT = 0;
	bit [0:7] data_shifted;
    bit [0:7] data;
    bit [0:(2*3)] shift;
    bit clock;

	
    regShifter #(.SHIFT_AS_ONE_HOT(SHIFT_AS_ONE_HOT)) M1 (.Op(data_shifted), .Ip(data), .shift_mag(shift), .clock(clock));

    always 
		#25 clock = ~clock;

	// always @(negedge second_inc) begin
	// 	$display("Result: %b data: %b shift:%h", result, data, shift);
	// end

	initial begin

        data = 'b1100_1111;
		shift = 'b011;

		#50 shift = 'b0000001;
		#50 shift = 'b0000010;
       // #50 shift = 'd100;
         #50 shift = 'b0010000;
        #50 shift = 'b010;
        #50 shift = 'b100000;
        #50 shift = 'b0000100;
		#50 shift = 'b0001000;
       
				#50 shift = 'b0000001;

        #100;
		$finish;

	end

    // @TODO: DEBUG PRINTS
    //initial begin
	//	$monitor("data_shifted: %b data: %b shift:%b clock : %b", data_shifted, data, shift, clock);
    //end


endmodule

