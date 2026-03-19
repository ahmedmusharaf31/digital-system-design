`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:40:56 AM
// Design Name: 
// Module Name: tb_jk_ff
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

module tb_jk_ff;
    reg J,K,CLK,RST;
    wire Q;

    jk_ff uut (.J(J),.K(K),.CLK(CLK),.RST(RST),.Q(Q));

    always #5 CLK = ~CLK;

    initial begin
        CLK=0; RST=1; J=0; K=0; #10;
        RST=0; J=1; K=0; #10;   
        J=0; K=1; #10;          
        J=1; K=1; #20;          
        J=0; K=0; #10;          
        $finish;
    end
endmodule
