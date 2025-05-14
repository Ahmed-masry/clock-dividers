module clk_div_6(
input wire clk, rst,
output reg clk_out
    
  );
reg [3:0] count;
always @(posedge clk, negedge rst)
  begin
    if(!rst)
      count <= 'b0;
    else 
      begin
        count <= count + 1;
        if (count < 6)
          begin
            clk_out <= 1'b0;
          end 
        else if (count < 11)
          begin
            clk_out <= 1'b1;
          end 
        else if (count == 11)
          begin
            clk_out <= 1'b1;
            count <= 'b0;
          end 
      end
  end
    
endmodule  
  

