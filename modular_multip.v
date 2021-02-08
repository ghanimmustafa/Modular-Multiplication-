`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:01 03/19/2019 
// Design Name: 
// Module Name:    modular_multip 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module modular_multip(clk,reset,X,Y,Z,T,state,i,R
    );
input clk;
input reset;
input [2:0] X;
input [2:0] Y;
input [2:0] Z;
output  reg signed [4:0] T ;
output reg [3:0] state;
output reg [1:0] i;
output  reg signed [4:0] R;

 always @(posedge clk)
	 begin
	 

	
	 
	 if(reset)
	 state<=10'd0;
	 else
	 begin
	 case(state)
	 10'd0: //Initial State
	 begin
	 state<=10'd1;
	 end
	 10'd1: //Initial State
	 begin
	 
	 state<=10'd2; 
	 end
	 10'd2://Initial State 
	 begin
	 state<=10'd3;
	 	end 
	 10'd3: //Multiplying state
	 begin
	 state<=10'd11;
	 end
	 10'd11: //Subtraction state (R=T-Z)
	 
	 state<=10'd4;
	 
	 
	 10'd4: // Timing Balance state introduced after the subraction state S11
	 begin
	 
	 if(R[4]==0)
	 state<=10'd5;
	 else if((Y[i]&&R[4])==1)
	 state<=10'd6;
	 else 
	 state<=10'd13;
	 end
	 10'd5: // First Condition state (T=R)
	 begin
	 if(Y[i]==1)
	 state<=10'd6; 
	 else
	 state<=10'd13;
	 end
	 
	 10'd6: //Second Condition state (T=T+X)
	 begin
	 
	 state<=10'd12;
	 end
	 10'd12://Second Condition state (R=T-Z)
	 state<=10'd7;
	 
	 10'd7: //Timing Balance state
	 
	 begin
	 
	 
	 if(R[4]==1)
	 state<=10'd13;
	 else
	 state<=10'd8;
	 end
	 10'd8:
	 begin
	 state<=10'd13;
	 end
	 10'd13:
	 state<=10'd9;
	 10'd9:
	 begin
	 if(i!=2'b11)
	 state<=10'd3;
	 else if(i==2'b11)
	 state<=10'd10;
	 end
	  10'd10:
	  state<=10'd10;
	 
	  default:
		begin
		state<=10'd0;
		end
		endcase
		end
		end
		
	 	
		
		
		
		
		
	always @(posedge clk)
	 begin
	 
	 if(state==10'd0)
	 T<=0;
	 else if(state==10'd1)
	 R<=0;
	 else if(state==10'd2)
	 i<=2'b11;

	
	 else if(state==10'd3)
	 T<=T<<1;
	 else if(state==10'd11)
	  R<=T-Z;
	
	 else if(state==10'd5)
	 T<=R  ;
	 else if(state==10'd6)
	 T<=T+X;
    else if(state==10'd12)
	 R<=T-Z;
	
	 else if(state==10'd8)
	 T<=R;
    else if(state==10'd13)
	 i<=i-2'b01;
	
	
	 end
	
		
endmodule
