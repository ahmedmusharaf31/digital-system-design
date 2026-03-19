`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 04:22:02 PM
// Design Name: 
// Module Name: 4_bit_sync_up
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

module d_ff (
    input clk,
    input rst,
    input D,
    output reg Q
    );
    
    always @(posedge clk) begin
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule


module sync_up_counter_dff (
    input clk,
    input rst,
    output [3:0] Q
    );

    wire [3:0] D;

    assign D = Q + 1'b1;

    d_ff dff0 (.clk(clk), .rst(rst), .D(D[0]), .Q(Q[0]));
    d_ff dff1 (.clk(clk), .rst(rst), .D(D[1]), .Q(Q[1]));
    d_ff dff2 (.clk(clk), .rst(rst), .D(D[2]), .Q(Q[2]));
    d_ff dff3 (.clk(clk), .rst(rst), .D(D[3]), .Q(Q[3]));

endmodule
