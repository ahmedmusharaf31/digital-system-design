`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:21:29 AM
// Design Name: 
// Module Name: tb_mux8to1
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

module tb_mux8to1;
    reg  [7:0] X, Y;
    reg  s;
    wire [7:0] M;

    mux8to1 uut (.X(X), .Y(Y), .s(s), .M(M));

    initial begin
        X = 8'h55; Y = 8'hAA; s = 0; #10;
        s = 1; #10;
        X = 8'h0F; Y = 8'hF0; s = 0; #10;
        s = 1; #10;
        $finish;
    end
endmodule
