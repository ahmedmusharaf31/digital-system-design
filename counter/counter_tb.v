`timescale 1ns/1ps

module tb_counter;

  // Testbench signals
  reg  [4:0] cnt_in;
  reg  en;
  reg  clk;
  reg  rst;
  reg  load;
  wire [4:0] cnt_out;

  // Instantiate DUT (Device Under Test)
  counter uut (
    .cnt_in(cnt_in),
    .en(en),
    .clk(clk),
    .rst(rst),
    .load(load),
    .cnt_out(cnt_out)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize
    clk   = 0;
    rst   = 1;
    en    = 0;
    load  = 0;
    cnt_in = 5'b00000;

    // Apply reset
    #10; rst = 0;

    // Enable counting
    en = 1;
    #50;   // let it count for a few cycles

    // Hold (disable enable)
    en = 0;
    #20;

    // Load a value (e.g. 12)
    cnt_in = 5'd12;
    load   = 1;
    #10;   // load on next clock edge
    load   = 0;

    // Enable counting again
    en = 1;
    #50;

    // Reset again
    rst = 1;
    #10; 
    rst = 0;

    // End simulation
    #20;
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | rst=%b load=%b en=%b cnt_in=%d | cnt_out=%d",
              $time, rst, load, en, cnt_in, cnt_out);
  end

endmodule
