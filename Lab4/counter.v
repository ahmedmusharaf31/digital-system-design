`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 02:36:10 PM
// Design Name: 
// Module Name: counter
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

module clk_div_1hz (
    input clk_in, 
    input reset,  
    output reg  clk_out
);

    localparam DIV_COUNT = 50_000_000;  
    reg [26:0] counter;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end
        else begin
            if (counter == DIV_COUNT-1) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule

// Formula: N=Fin/2*Fout = 50,000,000
// T=N*10ns = 0.5s
