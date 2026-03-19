`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 03:37:05 PM
// Design Name: 
// Module Name: Lab8_1_tb
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


module Lab8_1_tb;

reg clk, rst, w;
wire z;

Lab8_1 uut (
    .clk(clk), 
    .rst(rst), 
    .w(w), 
    .z(z)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    w = 0;
    #10;
    rst = 0;
    
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1; 
    #10 w = 1;

    #10 w = 0; 
    
    #10 w = 0;
    #10 w = 0;
    #10 w = 0; 
    #10 w = 0;

    #50 $finish;
end

endmodule
