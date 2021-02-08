`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:01 03/19/2019
// Design Name:   modular_multip
// Module Name:   C:/Users/Mustafa/Desktop/itu_2019_bahar/VLSI 2/Projeler/3rd_project/Q2_modular_multi/test_modular.v
// Project Name:  Q2_modular_multi
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: modular_multip
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_modular;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] X;
	reg [2:0] Y;
	reg [2:0] Z;

	// Outputs
	wire [4:0] T;
	wire [3:0] state;
	wire [1:0] i;
	wire [4:0] R;

	// Instantiate the Unit Under Test (UUT)
	modular_multip uut (
		.clk(clk), 
		.reset(reset), 
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.T(T), 
		.state(state),.i(i),.R(R)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		X = 0;
		Y = 0;
		Z = 0;
		

      reset=1;
      #50
		reset=0;
		
		
		X=3'b111;
		Y=3'b111;
		Z=3'b111;
		#800
		reset=1;
		#50
		reset=0;
	
	
		X=3'b001;
		Y=3'b010;
		Z=3'b011;
		#800
		reset=1;
		#50
		reset=0;
		X=3'b100;
		Y=3'b101;
		Z=3'b111;
       
		// Add stimulus here

	end
	always
	#10
	clk=~clk;
      
endmodule

