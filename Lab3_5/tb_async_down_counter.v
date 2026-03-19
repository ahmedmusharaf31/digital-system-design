`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 10:02:56 AM
// Design Name: 
// Module Name: tb_async_down_counter
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

module tb_async_down_counter;
    reg CLK,RST;
    wire [3:0] Q;

    async_down_counter uut(.CLK(CLK),.RST(RST),.Q(Q));

    always #5 CLK=~CLK;

    initial begin
        CLK=0; RST=1; #10;
        RST=0; #200;
        $finish;
    end
endmodule
