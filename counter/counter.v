`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 04:02:21 PM
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


module counter(
input [4:0] cnt_in,
input en,
input clk,
input rst,
input load,
output reg [4:0] cnt_out
    );
    
always @(posedge clk or posedge rst)
begin

if(rst) begin
cnt_out<=5'b00000;

end

else if(load) begin
cnt_out<=cnt_in;
end

else if(en) begin
cnt_out<=cnt_out+1'b1;
end

// else: hold value

end    
endmodule
