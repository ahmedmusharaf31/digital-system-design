`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 02:50:37 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input clk,
    input rst,
    input regwrite,
    input [4:0] readaddr1,
    input [4:0] readaddr2,
    input [4:0] writeaddr,
    input [31:0] writedata,
    output reg [31:0] readdata1,
    output reg [31:0] readdata2
);

reg [31:0] registers [31:0];

integer i;

always @(posedge clk or posedge rst)
begin
    if(rst) begin
        for(i=0;i<32;i=i+1)begin
            registers[i]<=32'b0;
        end
    end else if(regwrite && (writeaddr!=5'b0)) begin
       registers[writeaddr]<=writedata; 
    end
end

// port 1
always @(negedge clk) begin
    readdata1<=registers[readaddr1];
end

// port 2
always @(negedge clk) begin
    readdata2<=registers[readaddr2];
end

endmodule
