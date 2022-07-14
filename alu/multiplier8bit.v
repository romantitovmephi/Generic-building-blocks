`timescale 1ns / 1ps

module multiplier8bit(a,b,out, clk, start,working);
output [15:0] out;
output working;
input [7:0] a,b;
input clk, start;
reg [7:0] A, Q, M;
reg Q_1;
reg [3:0] count;
wire [7:0] sum, difference;
always @(posedge clk)
begin
if (start) begin
A <= 8'b0;
M <= a;
Q <= b;
Q_1 <= 1'b0;
count <= 4'b0;
end
else begin
case ({Q[0], Q_1})
2'b0_1 : {A, Q, Q_1} <= {sum[7], sum, Q};
2'b1_0 : {A, Q, Q_1} <= {difference[7], difference, Q};
default: {A, Q, Q_1} <= {A[7], A, Q};
endcase
count <= count + 1'b1;
end
end
half_adder adder (sum, A, M, 1'b0);
half_adder subtracter (difference, A, ~M, 1'b1);
assign out = {A, Q};
assign working = (count < 8);
endmodule


module half_adder(out, a, b, cin);
output [7:0] out;
input [7:0] a;
input [7:0] b;
input cin;
assign out = a + b + cin;
endmodule
