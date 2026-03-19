`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 02:16:40 PM
// Design Name: 
// Module Name: Lab8_1
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


module Lab8_1(
input clk, rst, w,
output reg z
);

(* fsm_encoding="one_hot" *) reg [2:0] cs,ns;

// reg [2:0] cs, ns;

parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
parameter s6=3'b110;
parameter s7=3'b111;

always @(posedge clk) begin
if(rst) cs<=s0;
else cs<=ns;
end

always @(*) begin
    case(cs)
    s0: begin
        if(w==0) begin
        ns=s5; z=0;
        end else begin
        ns=s1; z=0;
        end
    end

    s1: begin
        if(w==0) begin
        ns=s0; z=0;
        end else begin
        ns=s2; z=0;
    
    end
    end

    s2: begin
        if(w==0) begin
        ns=s0; z=0;
        end else begin
        ns=s3; z=0;
    
    end
    end

    s3: begin
        if(w==0) begin
        ns=s0; z=0;
        end else begin
        ns=s4; z=1;
    
    end
    end

    s4: begin
        if(w==0) begin
        ns=s0; z=0;
        end else begin
        ns=s4; z=1;
    
    end
    end

    s5: begin
        if(w==0) begin
        ns=s6; z=0;
        end else begin
        ns=s1; z=0;
    
    end
    end

    s6: begin
        if(w==0) begin
        ns=s7; z=1;
        end else begin
        ns=s1; z=0;
    
    end
    end

    s7: begin
        if(w==0) begin
        ns=s7; z=1;
        end else begin
        ns=s1; z=0;
    
    end
    end

    endcase
end
endmodule
