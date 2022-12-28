timescale 1ns/1ps
module counter(clk,rst,m,count); input clk,rst,m;
output [31:0]count;
reg [31 : 0] count = 0; always@(posedge clk or posedge rst)
begin
if(rst==1) count<=0;
else if(m==1) count<=count+1; else count<=count-1; end
// Defining a Timescale for Precision // Defining Module and Port List
// Defining Inputs
// Defining 32-bit Output as Reg type
// The Block is executed when begin
// EITHER of positive edge of clock or Neg Edge of Rst arrives // Both are independent events
endmodule
/* 32-bit up/down asynchronous reset counter for testbench-file name tb_counter.v*/
`timescale 1ns/1ps module counter_test;
reg clk; reg rst; / reg m;
wire [31:0] count;
counter counter1(clk,m,rst, count); initial clk = 0;
always #2 clk = ~clk;
initial begin
// Apply Inputs rst = 0;#5;
m = 0;
#200;
m= 1;
#200; rst = 1;
m = 0;
#100;
rst = 0; end
initial
#2000 $finish;
  
 
module full_adder( A,B,CIN,S,COUT); input A,B,CIN;
output S,COUT;
assign S = A^B^CIN;
assign COUT = (A&B) | (CIN&(A^B)); endmodule
/* fa_4bit.v → Top Module for Adding 4-bit Inputs */
module four_bit_adder(A,B,C0,S,C4); input [3:0] A,[3:0] B,C0;
output [3:0] S,C4;
wire C1,C2,C3;
full_adder fa0 (A[0],B[0],C0,S[0],C1); 
  full_adder fa1 (A[1],B[1],C1,S[1],C2); 
  full_adder fa2 (A[2],B[2],C2,S[2],C3);
  full_adder fa3 (A[3],B[3],C3,S[3],C4); 
endmodule
/* Test Bench – fa_test.v */
module test_4_bit;
reg [3:0] A;
reg [3:0] B; reg C0;
wire [3:0] S; wire C4; four_bit_adder dut(A,B,C0,S,C4); initial begin
A = 4'b0011;B=4'b0011;C0 = 1'b0; #10;
A = 4'b1011;B=4'b0111;C0 = 1'b1; #10; A = 4'b1111;B=4'b1111;C0 = 1'b1; #10; end
initial
#50 $finish; Endmodule
  
