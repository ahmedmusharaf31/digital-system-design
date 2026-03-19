`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:56:00 AM
// Design Name: 
// Module Name: tb_counter
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

module tb_counter;
    reg CLK,RST;
    wire [4:0] COUNT;

    counter uut(.CLK(CLK),.RST(RST),.COUNT(COUNT));

    always #5 CLK = ~CLK;

    initial begin
        CLK=0; RST=1; #10;
        RST=0;
        #300;
        $finish;
    end
endmodule
