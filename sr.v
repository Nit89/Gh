'timescale 1ns / 10ps
module SR_FF(S,R,clk,Q,Qbar);
input S,R,clk;
output Q,Qbar;
reg M,N;
always @(posedge clk)
begin
M = !(S & clk);
N = !(R & clk);
end
assign Q = !(M & Qbar);
assign Qbar = !(N & Q);
endmodule
Test bench code:
`timescale 1ns / 10ps
module SRFF_tb;
reg S, R; reg clk;
// Outputs
wire Q, Qbar;
// Instantiate the Unit Under Test (UUT)
SR_FF uut ( .S(S), .R(R), .clk(clk), .Q(Q), .Qbar(Qbar) );
initial begin
// Initialize Inputs
clk = 1'b0;
S =1'b0;
R=1'b0;
// Wait 100 ns for global reset to finish
#10;
// Add stimulus here
S =1'b1;R=1'b0;
#20 S =1'b0; R=1'b1;
#10 S =1'b0; R=1'b0;
#30 S =1'b1; R=1'b1;
#200 $finish; 
end
always #10 clk = ~clk; 
endmodule


create_clock -name clk -period 2 -waveform {0 1} [get_ports "clk"]
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_transition -
set_clock_uncertainty 0.01 [get_clocks "clk"]
set_input_delay -max 1 [get_ports "S"] -clock [get_clocks "clk"]
set_input_delay -max 1 [get_ports "R"] -clock [get_clocks "clk"]
set_output_delay -max 1 [get_ports "Q"] -clock [get_clocks "clk"]
set_output_delay -max 1 [get_ports "Qbar"] -clock [get_clocks "clk"]

