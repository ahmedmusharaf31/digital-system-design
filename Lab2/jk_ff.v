`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 06:39:07 AM
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

module jk_ff (
    input  wire J, K, CLK, RST,
    output reg  Q
);
    always @(posedge CLK or posedge RST) begin
        if (RST) 
            Q <= 1'b0;
        else begin
            case ({J,K})
                2'b00: Q <= Q;      
                2'b01: Q <= 1'b0;   
                2'b10: Q <= 1'b1;   
                2'b11: Q <= ~Q;     
            endcase
        end
    end
endmodule
