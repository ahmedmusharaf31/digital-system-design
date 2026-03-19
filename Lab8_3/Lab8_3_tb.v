`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 05:10:57 PM
// Design Name: 
// Module Name: Lab8_3_tb
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

module tb_light_flash;

    reg clk;
    reg rst;
    reg enable;
    reg start;
    wire led;

    light_flash uut (
        .clk(clk), 
        .rst(rst), 
        .enable(enable), 
        .start(start), 
        .led(led)
    );

    defparam uut.delay_uut.delay = 5;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        enable = 0;
        start = 0;

        #20;
        rst = 0;

        #20;
        enable = 1;

        #500;
        enable = 0;

        #200;
        $stop;
    end

endmodule
