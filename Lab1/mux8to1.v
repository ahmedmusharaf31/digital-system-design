`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:18:04 AM
// Design Name: 
// Module Name: mux8to1
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

module mux8to1 (
    input  [7:0] X, Y,
    input        s,
    output [7:0] M
);
    assign M = (s) ? Y : X;
endmodule
