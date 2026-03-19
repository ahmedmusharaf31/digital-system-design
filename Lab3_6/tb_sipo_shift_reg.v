`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 10:10:04 AM
// Design Name: 
// Module Name: tb_sipo_shift_reg
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

module tb_sipo_shift_reg;
    reg CLK,RST,SI;
    wire [3:0] Q;

    sipo_shift_reg uut(.CLK(CLK),.RST(RST),.SI(SI),.Q(Q));

    always #5 CLK=~CLK;

    initial begin
        CLK=0; RST=1; SI=0; #10;
        RST=0;
        SI=1; #10;  
        SI=0; #10;  
        SI=1; #10;  
        SI=1; #10;  
        #50;
        $finish;
    end
endmodule
