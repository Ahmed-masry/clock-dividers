`timescale 1ns/1ps
module clk_div_6_tb ();
parameter clk_PERIOD = 10;

reg                         clk, rst ;
wire                        clk_out;


  clk_div_6 DUT(
 .clk(clk),
 .rst(rst),
 .clk_out(clk_out)
 );
 
 always #(clk_PERIOD/2) clk =~clk;

initial 
  begin
    
    clk=1'b0;
    rst = 1'b1;
    #(clk_PERIOD/2)
    rst = 1'b0;
    #(clk_PERIOD/2)
    rst   = 1'b1;
    
    
      
  end
 
 endmodule
 
 
 
 
 
 
 
 








