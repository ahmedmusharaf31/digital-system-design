`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 04:42:54 PM
// Design Name: 
// Module Name: bit_sync_up_tb
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


`timescale 1ns / 1ps

module tb_sync_up_counter_dff;

    reg clk;
    reg rst;
    wire [3:0] Q;

    sync_up_counter_dff uut (
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;   
        #10;

        rst = 0;   
        #200;      

        rst = 1;   
        #10;

        rst = 0;   
        #50;

        $stop;     
    end

endmodule
