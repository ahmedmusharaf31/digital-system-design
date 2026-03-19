`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 03:29:30 PM
// Design Name: 
// Module Name: digital_clock
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2025 02:26:38 PM
// Design Name: 
// Module Name: up_counter_7seg
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

module digital_clock #(
    parameter integer CLK_HZ=100_000_000      
)(
    input  wire clk,
    input  wire rst,           
    output wire a, b, c, d, e, f, g,
    output wire dp,
    output wire [7:0] an       
);

localparam integer DIV_MAX=CLK_HZ - 1;
localparam integer DIV_W=$clog2(DIV_MAX+1);

reg [DIV_W-1:0] div_cnt = 0;
reg sec_tick = 1'b0;

always @(posedge clk) begin
if (rst) begin
    div_cnt  <= 0;
    sec_tick <= 1'b0;
end else begin
    if (div_cnt == DIV_MAX) begin
        div_cnt  <= 0;
        sec_tick <= 1'b1;       
    end else begin
        div_cnt  <= div_cnt + 1;
        sec_tick <= 1'b0;
    end
end
end

reg [5:0] sec = 0;
reg [5:0] min = 0;
reg [4:0] hr  = 0;

always @(posedge clk) begin
if (rst) begin
    sec <= 0;
    min <= 0;
    hr  <= 0;
end else if (sec_tick) begin
    if (sec == 6'd59) begin
        sec <= 0;
        if (min == 6'd59) begin
            min <= 0;
            if (hr == 5'd23) hr <= 0;
            else hr <= hr + 1'b1;
        end else begin
            min <= min + 1'b1;
        end
    end else begin
        sec <= sec + 1'b1;
    end
end
end

wire [3:0] d0 = sec % 10;
wire [3:0] d1 = sec / 10;
wire [3:0] d2 = min % 10;
wire [3:0] d3 = min / 10;
wire [3:0] d4 = hr  % 10;
wire [3:0] d5 = hr  / 10;

localparam integer REF_W = 19;
reg [REF_W-1:0] ref_cnt = 0;

always @(posedge clk) begin
    if (rst) ref_cnt <= 0;
    else ref_cnt <= ref_cnt + 1;
end

wire [2:0] sel = ref_cnt[REF_W-1 -: 3];
reg [3:0] cur_digit = 0;
reg [7:0] an_r = 8'hFF;

always @* begin
    case (sel)
        3'd0: begin cur_digit = d0; an_r = 8'b1111_1110; end 
        3'd1: begin cur_digit = d1; an_r = 8'b1111_1101; end 
        3'd2: begin cur_digit = d2; an_r = 8'b1111_1011; end 
        3'd3: begin cur_digit = d3; an_r = 8'b1111_0111; end 
        3'd4: begin cur_digit = d4; an_r = 8'b1110_1111; end 
        3'd5: begin cur_digit = d5; an_r = 8'b1101_1111; end 
        default: begin cur_digit = 4'hA; an_r = 8'b1111_1111; end 
    endcase
end

assign an = an_r;

reg [6:0] seg;

always @* begin
    case (cur_digit)
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        4'd5: seg = 7'b0010010;
        4'd6: seg = 7'b0000010;
        4'd7: seg = 7'b1111000;
        4'd8: seg = 7'b0000000;
        4'd9: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end

assign {g,f,e,d,c,b,a} = seg;
assign dp = 1'b1;

endmodule
