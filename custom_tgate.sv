/*
====================================================================================================
   Transmission gate logic circuit based bi-directional shifter 
   Author:      Avinash Eega
   Date:        04/17/2022
   Description: A module acts as a base that is similar to mux logic with "n" inputs and outputs. 
                Uses this module to construct a shifter with any number of inputs.
                All the inputs and outputs are one-hot encoded

====================================================================================================
*/

module custom_tgate(Op,ctrl,Ip);
	output Op;
	input Ip, ctrl;
	
	wire ctrl_bar;
	
	assign ctrl_bar = ~ctrl;
	
	nmos n1(Op,Ip,ctrl);
	pmos p1(Op,Ip,ctrl_bar);
	//cmos c1(Op,Ip,ctrl,ctrl_bar);
	
endmodule
