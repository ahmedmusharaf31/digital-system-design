`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:42:59 AM
// Design Name: 
// Module Name: register
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


module register(
    input [31:0]in,
    output reg [31:0]out,
    input clk, reset, en
);
always @(posedge clk , posedge reset)
begin
    if(reset)
        out <= 32'h0;
    else if (en)
        out <= in;
    end
endmodule
