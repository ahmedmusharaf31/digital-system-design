`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:46:18 AM
// Design Name: 
// Module Name: tb_mux5to1_3bit
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

module tb_mux5to1_3bit;
    reg  [2:0] U,V,W,X,Y;
    reg  [2:0] s;
    wire [2:0] M;

    mux5to1_3bit uut (.U(U),.V(V),.W(W),.X(X),.Y(Y),.s(s),.M(M));

    initial begin
        U=3'b001; V=3'b010; W=3'b011; X=3'b100; Y=3'b111;
        s=3'b000; #10;
        s=3'b001; #10;
        s=3'b010; #10;
        s=3'b011; #10;
        s=3'b100; #10;
        s=3'b101; #10;
        s=3'b110; #10;
        s=3'b111; #10;
        $finish;
    end
endmodule
