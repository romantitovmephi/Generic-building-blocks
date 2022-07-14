`timescale 1ns / 1ps

module xor8bit(a,b,out);
	input [7:0] a;
	input [7:0] b;
	output [7:0] out;
	assign out=a^ b;
endmodule
