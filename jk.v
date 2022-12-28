timescale 1ns / 10ps
module jkff(J, K, clk, Q, Qm);
input J, K, clk;
output reg Q;
output Qm;
always @(posedge clk)
begin
if(J == 0 && K == 0)
Q <= 0;
else if(J == 1 && K == 0)
Q <= 1;
else if(J == 0 && K == 1)
Q <= 0;
else if(J == 1 && K == 1)
Q <= ~Q;
end
assign Qm = ~Q;
endmodule
Test bench code:
`timescale 1ns / 10ps
module JKFF_tb;
// Inputs
reg J, K,,clk;
// Outputs
wire Q, Qm;
// Instantiate the Unit Under Test (UUT)
jkff uut ( .J(J), .K(K), .clk(clk), .Q(Q), .Qm(Qm) );
initial begin
// Initialize Inputs
clk = 1'b0;
J =1'b0;
K=1'b0;
// Wait 100 ns for global reset to finish
#10;
// Add stimulus here
J =1'b1; K=1'b0;
#20 J =1'b1; K=1'b1;
#10 J =1'b1; K=1'b0;
#30 J =1'b1; K=1'b1;
#30 J =1'b0; K=1'b0;
#200 $finish; 
end
always #10 clk = ~clk; 
endmodule

create_clock -name clk -period 2 -waveform {0 1} [get_ports "clk"] 
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_transition -
set_clock_uncertainty 0.01 [get_clocks "clk"]
set_input_delay -max 1 [get_ports "Reset"] -clock [get_clocks "clk"] 
set_input_delay -max 1 [get_ports "D"] -clock [get_clocks "clk"]
set_output_delay -max 1 [get_ports "Q"] -clock [get_clocks "clk"] 
set_output_delay -max 1 [get_ports "Qbar"] -clock [get_clocks "clk"]


