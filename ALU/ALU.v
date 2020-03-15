`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:34 04/09/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A_in, B_in, ALU_Sel, ALU_Out, Zero, Carry_Out, Overflow);

	input 	[32:0] A_in, B_in;
	input 	[ 3:0]  ALU_Sel;
	// Ex : ALU_Sel = 0010; R = FFEB; S = DDC3; // {Y = DDC4}
	//			dump_memory; $display ("gawgasgasgd"); endtask
	output 	[32:0] ALU_Out;
	output 		   Overflow, Zero, Carry_Out;
	
	reg		[ 32:0] ALU_Out;
	reg				Overflow, Zero, Carry_Out;
	
	always @ (A_in or B_in or ALU_Sel) begin
		case (ALU_Sel)
		    4'b0000: {Carry_Out,ALU_Out} = {1'b0, A_in & B_in}; // AND
		    4'b0001: {Carry_Out,ALU_Out} = {1'b0, A_in | B_in}; // OR
		    4'b0010: {Carry_Out,ALU_Out} = A_in + B_in;         // add
		    4'b0110: {Carry_Out,ALU_Out} = A_in - B_in;         // sub
		    4'b0111: begin 
		                  if (A_in<B_in) begin 
		                      {Carry_Out,ALU_Out} = {1'b0,1'b1};
		                  end else begin
		                      {Carry_Out,ALU_Out} = {1'b0,1'b0};
		                  end
		             end 
		    4'b1100: {Carry_Out,ALU_Out} = ~(A_in | B_in);      // NOR
		    4'b1111: begin 
		                  if (A_in == B_in) begin 
		                      {Carry_Out,ALU_Out} = {1'b0,1'b1};
		                  end else begin
		                      {Carry_Out,ALU_Out} = {1'b0,1'b0};
		                  end
		             end
		   
		    
		    
//			4'b0000:	{Carry_Out,ALU_Out} = {1'b0,B_In};
//			4'b0001:	{Carry_Out,ALU_Out} = {1'b0,A_in};
//			4'b0010:	{Carry_Out,ALU_Out} = B_In + 1;
//			4'b0011:	{Carry_Out,ALU_Out} = B_In - 1;
//			4'b0100:	{Carry_Out,ALU_Out} = A_in + B_In;
//			4'b0101:	{Carry_Out,ALU_Out} = A_in - B_In;
//			4'b0110:	begin
//							Carry_Out = B_In[0];
//							ALU_Out = B_In >> 1;
//						end
//			4'b0111: begin
//							Carry_Out = B_In[15];
//							ALU_Out = B_In << 1;
//						end
//			4'b1000:	{Carry_Out,ALU_Out} = {1'b0,A_in & B_In};
//			4'b1001:	{Carry_Out,ALU_Out} = {1'b0,A_in | B_In};
//			4'b1010:	{Carry_Out,ALU_Out} = {1'b0,A_in ^ B_In};
//			4'b1011:	{Carry_Out,ALU_Out} = {1'b0,~B_In};
//			4'b1100:	{Carry_Out,ALU_Out} = 0-B_In;
			default:	{Carry_Out,ALU_Out} = {1'b0,B_in};
		endcase
		
		Overflow = ALU_Out[31];
		if (ALU_Out == 32'b0)
			Zero = 1'b1;
		else
			Zero = 1'b0;
			
	end
endmodule
