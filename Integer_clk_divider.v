module Integer_clk_divider
#(parameter div_ratio_width = 8)  (
  input wire i_ref_clk, i_rst_n,
  input wire i_clk_en, 
  input wire [(div_ratio_width -1) : 0] i_div_ratio,
  output reg o_div_clk 
  );
  reg [3:0] counter;
  wire ClK_DIV_EN;
  wire [div_ratio_width-1:0] e_div = i_div_ratio >> 1;
  wire [div_ratio_width-1:0] o_div = i_div_ratio >> 1;
  assign ClK_DIV_EN = i_clk_en && (i_div_ratio != 0) && (i_div_ratio != 1);

  always @(posedge i_ref_clk, negedge i_rst_n)
    begin
      if(!i_rst_n)
        begin
          o_div_clk <= 1'b0;
          counter   <=  'b0;
        
        end
      else if (ClK_DIV_EN)
        begin
          counter <= counter + 1; 
          case (i_div_ratio[0])
            1'b0: begin
              if (counter == e_div)
                begin
                  o_div_clk <= ~o_div_clk;
                  counter   <= 1'b1;
                end
              else
                begin
                  counter <= counter + 1;
                end
              end
              1'b1: begin
              if (counter == o_div&& !o_div_clk)
                begin
                  o_div_clk <= 1;
                  counter   <= 1'b1;
                end
              else if (counter == (i_div_ratio - o_div) )
                begin
                  o_div_clk <= 0;
                  counter   <= 1'b1;
                end 
              else
                begin
                  counter <= counter + 1;
                end
              end
          
        
        endcase
    end
  end
    
    
  endmodule 
    
  


