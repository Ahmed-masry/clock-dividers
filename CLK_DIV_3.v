module clk_div_3(
  input wire clk,rst,
  output wire clk_out
  );


reg [2:0] count;
always @(posedge clk ,negedge rst)
  begin
    if(!rst)
      count <= 'b0;
    else
      begin
      count[0] <= ~ count[2];
      count[1] <=   count[0];
      count[2] <=   count[1];

    end
  end
assign clk_out = count[2];

endmodule