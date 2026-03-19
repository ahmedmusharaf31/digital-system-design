`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:44:29 AM
// Design Name: 
// Module Name: test12
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


module test12;
// Inputs
reg [31:0] in;
reg clk;
reg reset;
reg en;
// Outputs
wire [31:0] out;
// Instantiate the Unit Under Test (UUT)
register uut (
    .in(in),
    .out(out),
    .clk(clk),
    .reset(reset),
    .en(en)
);
always #5 clk = ~clk;
initial begin
// Initialize Inputs
in = 0;
clk = 0;
reset = 1;
en = 0;
#10 en = 1; reset = 0; in = 10;
#10 in = 20;
#10 in = 30;
#10 en = 0; in = 40;
#10 in = 50;
#10 in = 50;
#100 $finish;
end

endmodule
