`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:10:03 AM
// Design Name: 
// Module Name: barrel_shifter
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

module barrel_shifter (
    input  [7:0] data,
    input  [2:0] amt,
    output reg [7:0] out
);
    always @(*) begin
        case (amt)
            3'd0: out = data;                        
            3'd1: out = {data[0],   data[7:1]};      
            3'd2: out = {data[1:0], data[7:2]};      
            3'd3: out = {data[2:0], data[7:3]};
            3'd4: out = {data[3:0], data[7:4]};
            3'd5: out = {data[4:0], data[7:5]};
            3'd6: out = {data[5:0], data[7:6]};
            3'd7: out = {data[6:0], data[7]};
            default: out = data;
        endcase
    end
endmodule
