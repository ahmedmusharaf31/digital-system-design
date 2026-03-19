`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 09:44:54 AM
// Design Name: 
// Module Name: tb_reg_generic
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

module tb_reg_generic;
    reg CLK,RST;
    reg [7:0] D;
    wire [7:0] Q;

    reg_generic uut(.CLK(CLK),.RST(RST),.D(D),.Q(Q));

    always #5 CLK=~CLK;

    initial begin
        CLK=0; RST=1; D=8'h00; #10;
        RST=0; D=8'hA5; #10;
        D=8'h3C; #10;
        D=8'hFF; #10;
        $finish;
    end
endmodule
