//d flip flop //////

`timescale 1ns / 10ps
module DFF( Q,Qbar,D,Clk,Reset);
output reg Q;
output Qbar;
input D,Clk,Reset;
always @(posedge Clk)
begin
if (Reset == 1'b1) //If at reset
Q <= 1'b0;
else
Q <= D;
end
assign Qbar = ~Q;
endmodule

//Test bench code:
`timescale 1ns / 10ps
module DFF_tb;
reg D, Clk, Reset; // Inputs
wire Q, Qbar; // Outputs
// Instantiate the Unit Under Test (UUT)
DFF uut ( .Q(Q), .Qbar(Qbar), .D(D), .Clk(Clk), .Reset(Reset));
initial begin
D = 1'b0; // Initialize Inputs
Clk = 1'b0;
Reset = 1'b1;
// Wait 100 ns for global reset to finish
#100;
// Add stimulus here
Reset = 1'b0;
#20;
forever #40 D = ~ D;
end
always #10 Clk = ~Clk; 
endmodule
//
create_clock -name clk -period 2 -waveform {0 1} [get_ports "clk"]
set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_transition -
set_clock_uncertainty 0.01 [get_clocks "clk"]
set_input_delay -max 1 [get_ports "Reset"] -clock [get_clocks "clk"]
set_input_delay -max 1 [get_ports "D"] -clock [get_clocks "clk"]
set_output_delay -max 1 [get_ports "Q"] -clock [get_clocks "clk"]
set_output_delay -max 1 [get_ports "Qbar"] -clock [get_clocks "clk"]
