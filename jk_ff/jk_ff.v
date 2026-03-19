`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 03:18:42 PM
// Design Name: 
// Module Name: jk_ff
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


module jk_ff(
input j,k,
input clk, rst,
output reg q,
output wire qbar
    );

always @(posedge clk or posedge rst)
begin

if(rst) begin
    q<=0;
end

else begin
    case({j,k})
    2'b00: q<=q;
    2'b01: q<=0;
    2'b10: q<=1;
    2'b11: q<=~q;
    default: q<=q;
    endcase
    
end
end

assign qbar=~q;

endmodule
