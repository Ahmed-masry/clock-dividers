`timescale 1ns/1ps
module Integer_clk_divider_tb;

  // Parameters
  parameter div_ratio_width = 8;

  // Inputs
  reg i_ref_clk;
  reg i_rst_n;
  reg i_clk_en;
  reg [div_ratio_width-1:0] i_div_ratio;

  // Outputs
  wire o_div_clk;

  // Instantiate the Unit Under Test (UUT)
  Integer_clk_divider #(div_ratio_width) uut (
    .i_ref_clk(i_ref_clk), 
    .i_rst_n(i_rst_n), 
    .i_clk_en(i_clk_en), 
    .i_div_ratio(i_div_ratio), 
    .o_div_clk(o_div_clk)
  );

  initial begin
    // Wait for global reset to finish
    #100;
    i_rst_n = 1;
    // Initialize Inputs
    #100;
    i_ref_clk = 0;
    i_rst_n = 0;
    i_clk_en = 0;
    i_div_ratio = 0;

    // Wait for global reset to finish
    #100;
    i_rst_n = 1;
    // Test case : Divide by 2
    i_div_ratio = 2;
    i_clk_en = 1;
    #1000;
    // Test case : Divide by 3
    i_div_ratio = 3;
    i_clk_en = 1;
    #1000;
    // Test case : Divide by 4
    i_div_ratio = 4;
    i_clk_en = 1;
    #1000;
    // Test case : Divide by 5
    i_div_ratio = 5;
    i_clk_en = 1;
    #1000;
    
    // Test case : Divide by 6
    i_div_ratio = 6;
    #1000;
    // Test case : Divide by 7
    i_div_ratio = 7;
    #1000;

    // Test case : Divide by 8
    i_div_ratio = 8;
    #1000;
    
    // Test case : Disable clock divider
    i_clk_en = 0;
    #1000;

    // Test case : Reset
    i_rst_n = 0;
    #100;
    i_rst_n = 1;
    #1000;

    $stop;
  end
  
  // Generate clock
  always #10 i_ref_clk = ~i_ref_clk;

endmodule
