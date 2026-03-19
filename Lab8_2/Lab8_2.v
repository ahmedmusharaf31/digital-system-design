`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 04:12:46 PM
// Design Name: 
// Module Name: Lab8_2
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


module Lab8_2(
input clk, rst, w,
output reg z
);

reg [3:0] sreg0, sreg1;

always @(posedge clk) begin
if(rst) begin
    sreg0<=4'b1111;
    sreg1<=4'b0000;
end else begin
    sreg0<={sreg0[2:0],w};
    sreg1<={sreg1[2:0],w};
end
end

always @(*) begin
    z = (sreg1==4'b1111) || (sreg0==4'b0000);
end

endmodule
