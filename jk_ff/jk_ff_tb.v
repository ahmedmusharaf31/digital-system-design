`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 03:40:04 PM
// Design Name: 
// Module Name: jk_ff_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jk_ff_tb();

reg j,k,clk,rst;
wire q,qbar;    

jk_ff uut(.j(j),
.k(k),
.clk(clk),
.rst(rst),
.q(q),
.qbar(qbar)
);

always #5 clk=~clk;

initial begin
// Initialize
clk = 0;
rst = 1;
j = 0;
k = 0;

// Apply reset
#10;
rst = 0;

// Test sequence
// Hold state (J=0, K=0)
#10; j=0; k=0;
#20;

// Set state (J=1, K=0)
#10; j=1; k=0;
#20;

// Reset state (J=0, K=1)
#10; j=0; k=1;
#20;

// Toggle state (J=1, K=1)
#10; j=1; k=1;
#50;

// Mix cases
#10; j=0; k=1;   // Reset
#20; j=1; k=0;   // Set
#20; j=1; k=1;   // Toggle
#40;

// Apply reset again
rst = 1;
#10;
rst = 0;

// End simulation
#50;
$finish;
end

// Monitor outputs
initial begin
$monitor("Time=%0t | rst=%b j=%b k=%b | q=%b qbar=%b", 
          $time, rst, j, k, q, qbar);
end
 
endmodule
