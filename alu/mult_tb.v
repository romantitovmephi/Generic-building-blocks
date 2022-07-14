`timescale 1ns / 1ps

module mult_test;
reg clk, start;
reg [7:0] a, b;
wire [15:0] ab;
wire working;
multiplier8bit multiplier1(a, b, ab, clk, start,working);
initial begin
clk = 0;
$display("first example: a = 3 b = 17");
a = 3; b = 17; start = 1; #50 start = 0;
#80 $display("first example done");
$display("second example: a = 7 b = 7");
a = 8'b11111111; b = 2'b01; start = 1; #50 start = 0;
#80 $display("second example done");
$finish;
end
always #10 clk = !clk;
always @(posedge clk) $strobe("ab: %d working: %d at time=%t", ab, working, $stime);
endmodule