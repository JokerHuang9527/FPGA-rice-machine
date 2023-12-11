`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:19 12/04/2023 
// Design Name: 
// Module Name:    ricemachine 
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
module ricemachine(
	input sw,
	output reg [1:0]led,
	input clk,
	input reset
    );
	integer tick;
	reg dclk;
	
	
	always @(posedge clk, posedge reset)begin
		if(reset == 1'b1)begin
			tick <= 1'b0;
			dclk <= 1'b0;
		end
		else if(tick == ( 50000000 - 1))begin
			tick <= 0;
			dclk <= ~dclk;
		end
		else begin
			tick <= tick + 1;
		end
	end
	
	integer op0;
	integer op1;
	
	always @(posedge dclk, posedge reset)begin
		if(reset == 1'b1 || op1 == 4 || op0 == 4)begin
			op0 <= 1;
			op1 <= 1;
		end else begin
			if(sw ==1'b1 && op0 <= 4)begin
				op0 <= op0 + 1;
			end
			else if(sw ==1'b0 && op1 <= 4)begin
				op1 <= op1 + 1;
			end
		end
	end
	
	always @(*)begin
		if(reset ==1'b0)begin
			if(sw ==1'b1)begin
				case(op0)
					1: led<=2'b00;
					2: led<=2'b01;
					3: led<=2'b11;
					4: led<=2'b10;
				endcase
			end
			else if(sw ==1'b0)begin
				case(op1)
					1: led<=2'b00;
					2: led<=2'b10;
					3: led<=2'b11;
					4: led<=2'b01;
				endcase
			end
		end
	end
endmodule
