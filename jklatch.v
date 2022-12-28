`timescale 1ns / 10ps
module JKLatch(J, K, en, Q,Qm);
input J, K, en;
output reg Q;
output Qm;
always @(en)
begin
if(J == 0 && K == 0)
Q <= Q;
else if(J == 1 && K == 0)
Q <= 1;
else if(J == 0 && K == 1)
Q <= 0;
else if(J == 1 && K == 1)
Q <= ~Q;
end
assign Qm=~Q;
endmodule
Test bench code:
`timescale 1ns / 10ps
module JKlatch_tb;
reg J, K, en; // Inputs
wire Q, Qm; // Outputs
// Instantiate the Unit Under Test (UUT)
JKLatch uut (.J(J), .K(K), .en(en), .Q(Q), .Qm(Qm));
initial begin
J = 1'b0; // Initialize Inputs
K = 1'b0;
en =1'b1;
#50; // Wait 100 ns for global reset to finish
// Add stimulus here
#10 J=1'b1; K=1'b0;
#100 en =1'b0;
#50 J=1'b0; K=1'b0;
#50 J=1'b1; K=1'b0;
#50 en =1'b1;
#100 J=1'b0; K=1'b1;
#150 J=1'b0; K=1'b0;
#100 J=1'b1; K=1'b0;
#150 J=1'b1; K=1'b1;
#50 J=1'b0; K=1'b0;
#200 J=1'b0; K=1'b0;
#600 $finish;
end
endmodule


set_input_delay -max 1 [get_ports "J"] 
set_input_delay -max 1 [get_ports "K"] 
set_input_delay -max 1 [get_ports "en"] 
set_output_delay -max 1 [get_ports "Q"] 
set_output_delay -max 1 [get_ports "Qm"]
