`timescale 1ns / 1ps

module adder8bit_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;

	// Outputs
	wire [7:0] sum;
	wire carry;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	adder8bit uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		clk=0;
        
		// Add stimulus here

	end
	always #5 clk = !clk;
	always@(posedge clk)
begin	
#10 a=8'b00000001;b=8'b00000001;
#10 a=8'b00000010;b=8'b00000011;
#10 a=8'b10000001;b=8'b10000001;
#10 a=8'b00011001;b=8'b00110001;
#10 a=8'b00000011;b=8'b00000011;
#10 a=8'b11111111;b=8'b00000001;
#10 a=8'b11111111;b=8'b00000000;
#10 a=8'b11111111;b=8'b11111111;
//#10 $stop;
end
      
endmodule

