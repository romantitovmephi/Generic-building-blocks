module trigger #(parameter WIDTH = 8) (input logic
input logic output logic
always_ff @(posedge clk, if (reset) q else q <= d;
endmodule
clk, reset, [WIDTH−1:0] d,
[WIDTH−1:0] q);
posedge reset) <= 0;