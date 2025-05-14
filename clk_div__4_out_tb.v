
`timescale 1ns/1ps
module clk_divider_4_out_tb ();
parameter clk_in_PERIOD = 10;

reg                         clk_in, rst ;
wire                        clk_out2,clk_out4,clk_out8,clk_out16;


  clk_divider_4_out DUT(
 .clk_in(clk_in),
 .rst(rst),
 .clk_out2(clk_out2),
 .clk_out4(clk_out4),
 .clk_out8(clk_out8),
 .clk_out16(clk_out16)
 );
 
 always #(clk_in_PERIOD/2) clk_in =~clk_in;

initial 
  begin
    
    clk_in=1'b0;
    rst = 1'b1;
    #(clk_in_PERIOD/2)
    rst = 1'b0;
    #(clk_in_PERIOD/2)
    rst   = 1'b1;
    
    
      
  end
 
 endmodule
 
 
 
 
 
 
 
 





