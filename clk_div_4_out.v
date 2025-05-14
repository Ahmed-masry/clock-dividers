module clk_divider_4_out(
    input wire clk_in,
    input wire rst,
    output wire clk_out2,clk_out4,clk_out8,clk_out16
);

reg [3:0] c_state ;
    always @( posedge clk_in ,negedge rst )
    begin
        if (!rst)
            c_state[0] <= 'b0;
        else
            c_state[0]<= ~c_state[0];   
     end
always @( posedge c_state[0] ,negedge rst )
    begin
        if (!rst)
            c_state[1] <= 'b0;
        else
            c_state[1]<= ~c_state[1];   
     end
     always @( posedge c_state[1] ,negedge rst )
    begin
        if (!rst)
            c_state[2] <= 'b0;
        else
            c_state[2]<= ~c_state[2];   
     end
     always @( posedge c_state[2] ,negedge rst )
    begin
        if (!rst)
            c_state[3] <= 'b0;
        else
            c_state[3]<= ~c_state[3];   
     end
assign clk_out2= c_state[0];
assign clk_out4= c_state[1];
assign clk_out8= c_state[2];
assign clk_out16= c_state[3];



endmodule 