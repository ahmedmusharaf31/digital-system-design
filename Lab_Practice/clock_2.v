`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 10:42:20 AM
// Design Name: 
// Module Name: Digital_clock
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


module clock_wow(
    input clk,                // Main clock signal
    input reset,              // Reset signal
    output reg [6:0] ssd,     // Seven-segment display output
    output reg [7:0] anode    // Anode output for multiplexing
);

    reg [25:0] count;         // Counter for generating 1Hz clock
    reg clk_1hz;              // 1Hz clock signal
    reg [3:0] sec_lss;        // Least significant second digit
    reg [3:0] sec_mss;        // Most significant second digit
    reg [3:0] min_lss;        // Least significant minute digit
    reg [3:0] min_mss;        // Most significant minute digit
    reg [3:0] hr_lss;         // Least significant hour digit
    reg [3:0] hr_mss;         // Most significant hour digit
    reg [19:0] seg_count;     // Counter for segment multiplexing
    reg [3:0] number;         // Digit to be displayed

    // Generate 1Hz clock from 100MHz clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_1hz <= 0;
        end else if (count == 50_000_000) begin
            clk_1hz <= ~clk_1hz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end

    // Clock logic for seconds, minutes, and hours
    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            sec_lss <= 0;
            sec_mss <= 0;
            min_lss <= 0;
            min_mss <= 0;
            hr_lss  <= 0;
            hr_mss  <= 0;
        end else begin
            if (sec_mss == 5 && sec_lss == 9) begin
                sec_mss <= 0; 
                sec_lss <= 0;  // 59 ? 00
                if (min_mss == 5 && min_lss == 9) begin
                    min_mss <= 0; 
                    min_lss <= 0;
                    if (hr_mss == 2 && hr_lss == 3) begin
                        hr_mss <= 0;          // 23 ? 00
                        hr_lss <= 0;
                    end else if (hr_lss == 9) begin
                        hr_lss <= 0;
                        hr_mss <= hr_mss + 1;
                    end else begin
                        hr_lss <= hr_lss + 1;
                    end
                end else if (min_lss == 9) begin
                    min_lss <= 0;
                    min_mss <= min_mss + 1;
                end else begin
                    min_lss <= min_lss + 1;
                end
            end else if (sec_lss == 9) begin
                sec_lss <= 0;
                sec_mss <= sec_mss + 1;
            end else begin
                sec_lss <= sec_lss + 1;
            end
        end
    end

    // Multiplexing logic for seven-segment display
    always @(posedge clk) begin
        seg_count <= seg_count + 1;
    end

    always @(*) begin
        case (seg_count[19:17])
            3'd0: begin
                number = sec_lss;  // Display least significant second digit
                anode = 8'b11111110;
            end
            3'd1: begin
                number = sec_mss;  // Display most significant second digit
                anode = 8'b11111101;
            end
            3'd2: begin
                number = min_lss;  // Display least significant minute digit
                anode = 8'b11111011;
            end
            3'd3: begin
                number = min_mss;  // Display most significant minute digit
                anode = 8'b11110111;
            end
            3'd4: begin
                number = hr_lss;   // Display least significant hour digit
                anode = 8'b11101111;
            end
            3'd5: begin
                number = hr_mss;   // Display most significant hour digit
                anode = 8'b11011111;
            end
            default: begin
                number = 4'b1111;  // Turn off all segments
                anode = 8'b11111111;
            end
        endcase
    end

    // Seven-segment display encoding
    always @(*) begin
        case (number)
            4'd0: ssd = 7'b1000000; // 0
            4'd1: ssd = 7'b1111001; // 1
            4'd2: ssd = 7'b0100100; // 2
            4'd3: ssd = 7'b0110000; // 3
            4'd4: ssd = 7'b0011001; // 4
            4'd5: ssd = 7'b0010010; // 5
            4'd6: ssd = 7'b0000010; // 6
            4'd7: ssd = 7'b1111000; // 7
            4'd8: ssd = 7'b0000000; // 8
            4'd9: ssd = 7'b0010000; // 9
            default: ssd = 7'b1111111; // Turn off all segments
        endcase
    end

endmodule


// Ahmed's Code
module clock_pw(input clk,
input rst,
output reg [6:0] ssd,
output reg [7:0] anode); 

reg clk_1hz;
reg [25:0] count;
reg [3:0] sec_lss;
reg [3:0] sec_mss;
reg [3:0] min_lss;
reg [3:0] min_mss;
reg [3:0] hr_lss;
reg [3:0] hr_mss;
reg [19:0] seg;
reg [3:0] number;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        clk_1hz<=0;
        count<=0;
               
    end else if(count==50_000_000) begin
        clk_1hz<=~clk_1hz;
        count<=0;
    end else
        count<=count+1;
end


always @(posedge clk_1hz or posedge rst) begin
    if(rst) begin
        sec_lss<=0;
        sec_mss<=0;
        min_lss<=0;
        min_mss<=0;
        hr_lss<=0;
        hr_mss<=0;
    end else begin
        if(sec_lss==9 && sec_mss==5) begin
            sec_lss<=0;
            sec_mss<=0;
            if(min_lss==9 && min_mss==5) begin
                min_lss<=0;
                min_mss<=0;
                if(hr_lss==3 && hr_mss==2) begin
                    hr_lss<=0;
                    hr_mss<=0;
                end else if(hr_lss==9) begin
                    hr_lss<=0;
                    hr_mss<=hr_mss+1;
                end else begin
                    hr_lss<=hr_lss+1;
                end
            end else if(min_lss==9) begin
                min_lss<=0;
                min_mss<=min_mss+1;
            end else begin
                min_lss<=min_lss+1;                             
            end
        end else if(sec_lss==9) begin
           sec_lss<=0;
           sec_mss<=sec_mss+1; 
        end else begin
            sec_lss<=sec_lss+1;
        end            
    end
end

always @(posedge clk) begin
    seg<=seg+1;
end

always @(*) begin
    case(seg[19:17])
        3'd0: begin
            number=sec_lss;
            anode=8'b11111110;
        end

        3'd1: begin
            number=sec_mss;
            anode=8'b11111101;
        end

        3'd2: begin
            number=min_lss;
            anode=8'b11111011;
        end

        3'd3: begin
            number=min_mss;
            anode=8'b11110111;
        end

        3'd4: begin
            number=hr_lss;
            anode=8'b11101111;
        end

        3'd5: begin
            number=hr_mss;
            anode=8'b11011111;
        end
        
        default: begin
            number=4'b1111;
            anode=8'b11111111;            
        end
    endcase
end

always @(*) begin
    case(number)
        4'd0: ssd = 7'b1000000;
        4'd1: ssd = 7'b1111001;
        4'd2: ssd = 7'b0100100;
        4'd3: ssd = 7'b0110000;
        4'd4: ssd = 7'b0011001;
        4'd5: ssd = 7'b0010010;
        4'd6: ssd = 7'b0000010;
        4'd7: ssd = 7'b1111000;
        4'd8: ssd = 7'b0000000;
        4'd9: ssd = 7'b0010000;
        default: ssd = 7'b1111111;
    endcase
end

endmodule

// 1 Mhz clock
module clock_pw_1(input clk_in,
input rst,
output reg clk_out);

reg [6:0] counter;

//always @(posedge clk_in or posedge rst)
//begin
//    if(rst) begin
//        counter<=0;
//        clk_out<=0;
//    end else begin
//        if(counter==49) begin
//            clk_out<=~clk_out;
//            counter<=0;
//        end else begin
//            counter<=counter+1;
//        end
//    end
//end


module zero_99(input clk,
input rst, input up, input down,
output reg a,b,c,d,e,f,g,dp,
output reg [7:0] anode);

reg [3:0] first;
reg [3:0] second;
reg [24:0] delay;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        delay<=0;
    end else begin
        delay<=delay+1;
    end
end

reg up_val, down_val;
always @(posedge clk) begin
     up_val<=up;
     down_val<=down;
end

wire up_en=~up_val & up;
wire down_en=~down_val & down;

always @(posedge clk or posedge rst) begin
    if(rst) begin
       first<=0;
       second<=0;
    end else begin
        if(up_en) begin
            if(first==4'd9) begin
                first<=0;
                
                if(second==4'd9) begin
                    second<=0;
                end else begin
                    second<=second+1;
                end
                
            end else begin
                first<=first+1;
            end
        end else if(down_en) begin
            if(first==4'd0) begin
            first<=9;
            
            if(second==4'd0) begin
                second<=9;
            end else begin
                second<=second-1;
            end
            
        end else begin
            first<=first-1;
        end                        
        end else begin
            first<=first;
            second<=second;
        end
    end
end


localparam N=19;
reg[N-1:0] seg_count;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        seg_count<=0;
     end else begin
        seg_count<=seg_count+1;
     end
end

reg [3:0] number;

always @(*) begin
    case(seg_count[N-1:N-2])
        2'b00: begin
            number=first;
            anode=8'b11111110;
        end
        2'b01: begin
            number=second;
            anode=8'b11111101;
        end
        default: begin
            number=4'b1111;
            anode=8'b11111111;
        end
    endcase
end

reg [6:0] sseg;
always @(*) begin
    case(number)
    4'd0 : sseg = 7'b1000000;
    4'd1 : sseg = 7'b1111001;
    4'd2 : sseg = 7'b0100100;
    4'd3 : sseg = 7'b0110000;
    4'd4 : sseg = 7'b0011001;
    4'd5 : sseg = 7'b0010010;
    4'd6 : sseg = 7'b0000010;
    4'd7 : sseg = 7'b1111000;
    4'd8 : sseg = 7'b0000000;
    4'd9 : sseg = 7'b0010000;
    default: sseg = 7'b0111111; // dash
    endcase   
end

assign {g,f,e,d,c,b,a}=sseg;
assign dp=1'b1;

endmodule

