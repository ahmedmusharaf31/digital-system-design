`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 02:28:38 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;

reg [31:0] A;
reg [31:0] B;
reg [2:0] alu_sel;

wire [31:0] res;

ALU uut(
    .A(A),
    .B(B),
    .alu_sel(alu_sel),
    .res(res)
);

initial begin
    $monitor("Time=%0t | A=%h , B=%h , Opcode=%b | Result=%h", $time, A, B, alu_sel, res);
    
    A=32'd20;
    B=32'd5;
    alu_sel=3'b000;
    #10;
    
    alu_sel=3'b001;
    #10;
    
    alu_sel=3'b010;
    #10;

    alu_sel=3'b011;
    #10;
            
    alu_sel=3'b100;
    #10;

    alu_sel=3'b101;
    B=32'hDEADBEEF;
    #10;
    
    alu_sel=3'b110;
    #10;
        
        
    alu_sel=3'b111;
    #10;
            
    
    $finish;
end
endmodule
