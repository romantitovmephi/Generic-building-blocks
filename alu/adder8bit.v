`timescale 1ns / 1ps

module adder8bit(a,b,sum,carry,overflow);
	 input [7:0] a;
	 input [7:0] b;
	 output [7:0] sum;
	 output carry;
	 output overflow;
	 wire [7:0] car;
	 wire [7:0] pre_sum; 
	 adder add0(a[0],b[0],0,pre_sum[0],car[0]);
	 adder add1(a[1],b[1],car[0],pre_sum[1],car[1]);
	 adder add2(a[2],b[2],car[1],pre_sum[2],car[2]);
	 adder add3(a[3],b[3],car[2],pre_sum[3],car[3]);
	 adder add4(a[4],b[4],car[3],pre_sum[4],car[4]);
	 adder add5(a[5],b[5],car[4],pre_sum[5],car[5]);
	 adder add6(a[6],b[6],car[5],pre_sum[6],car[6]);
	 adder add7(a[7],b[7],car[6],pre_sum[7],car[7]);
	 assign carry=car[7];
	 
	 assign overflow=car[7]^car[6];
	 
	 assign sum[0]=pre_sum[0]&~overflow;
	 assign sum[1]=pre_sum[1]&~overflow;
	 assign sum[2]=pre_sum[2]&~overflow;
	 assign sum[3]=pre_sum[3]&~overflow;
	 assign sum[4]=pre_sum[4]&~overflow;
	 assign sum[5]=pre_sum[5]&~overflow;
	 assign sum[6]=pre_sum[6]&~overflow;
	 assign sum[7]=pre_sum[7]&~overflow;
	 
	 endmodule

module adder(x,y,cin,sum,cout);
input x;
input y;
input cin;
output sum;
output cout;
assign sum=x^y^cin;
assign cout=(x&y)|(y&cin)|(cin&x);
endmodule