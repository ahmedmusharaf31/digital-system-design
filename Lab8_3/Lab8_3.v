`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 04:33:35 PM
// Design Name: 
// Module Name: Lab8_3
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


module delay_1sec(clk, rst, done, done2, start);

    input clk, rst, start;
    output reg done, done2;
    
    parameter delay = 99_999_999;
    
    reg [26:0] count;
    
    always @ (posedge clk)
    begin
        if (rst)
        begin
            done <= 0;
            done2 <= 0;
            count <= 0;
        end
        else if (start)
        begin
            if (count == delay)
            begin
                done <= 1;
                done2 <= 1;
                count <= 0;
            end
            else
            begin
                done <= 0;
                done2 <= 0;
                count <= count + 1;
            end
        end
        else
        begin
            done <= 0;
            done2 <= 0;
            count <= 0;
        end
    end

endmodule

module light_flash (clk, rst, enable, start, led);

    input clk, rst, start, enable;
    output reg led;
    
    parameter idle = 3'b000;
    parameter flash = 3'b001;
    parameter gap = 3'b010;
    
    wire delay_done, delay_done2;
    reg delay_start;
    reg [1:0] count2;
    
    reg [2:0] current_state, next_state;
    
    delay_1sec delay_uut (
        .clk(clk), 
        .rst(rst), 
        .done(delay_done), 
        .done2(delay_done2), 
        .start(delay_start)
    );
    
    always @ (posedge clk) begin
        if (rst) begin
            current_state <= idle;
            count2 <= 0;
        end
        else begin
            current_state <= next_state;
            if (current_state == flash && delay_done)
                count2 <= count2 + 1;
            else if (current_state == idle)
                count2 <= 0;
        end
    end
    
    always @ * begin
        led = 0;
        delay_start = 0;
        next_state = current_state;
        
        case (current_state)
            idle: begin
                if (enable) begin
                    delay_start = 0;
                    next_state = flash;
                    led = 0;
                end
                else begin
                    delay_start = 0;
                    next_state = idle;
                    led = 0;
                end
            end
            
            flash: begin
                if (delay_done) begin
                    delay_start = 0;
                    next_state = gap;
                    led = 0;
                end
                else begin
                    delay_start = 1;
                    next_state = flash;
                    led = 1;
                end
            end
            
            gap: begin
                if (delay_done) begin
                    delay_start = 0;
                    if (enable) 
                        next_state = flash;
                    else 
                        next_state = idle;
                    led = 0;
                end
                else begin
                    delay_start = 1;
                    next_state = gap;
                    led = 0;
                end
            end
            
            default: next_state = idle;
        endcase
    end

endmodule
