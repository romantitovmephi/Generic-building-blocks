module alu8bit(instr,result1,result2,carry,overflow,clk,start);
input [17:0] instr;
input clk,start;
output reg [7:0] result1,result2;
wire  c,o;
wire [15:0] result;
output reg carry,overflow;
wire [1:0] op;
wire [7:0] sum;
wire [7:0] x;
wire [7:0] y;
wire working;
assign op[1]=instr[17];
assign op[0]=instr[16];
always@(op)
begin
case(op)
2'b00: begin 
		assign result1=8'b00000000;
		assign result2=sum;
		assign carry=c;
		assign overflow=o;
		 end
2'b01: begin
			assign result1=8'b00000000;
			assign result2=x;
			assign carry=0;
		assign overflow=0;
		 end	
2'b10: 
		begin
			assign result1=8'b00000000;
			assign carry=0;
		assign overflow=0;
		assign result2=y;
		end	
2'b11: 
	begin
		assign result1=result[15:8];
		assign result2=result[7:0];
				assign carry=0;
		assign overflow=0;
	end
endcase 
end
adder8bit add1(instr[15:8],instr[7:0],sum,c,o);
and8bit and1(instr[15:8],instr[7:0],x);
xor8bit xor1(instr[15:8],instr[7:0],y);
multiplier8bit mult1(instr[15:8],instr[7:0],result,clk,start,working);
endmodule
