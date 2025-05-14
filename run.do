vlib work
vlog -f sourcefile.txt
vsim -voptargs=+accs work.Integer_clk_divider_tb
add wave *
add wave -position insertpoint  \
sim:/Integer_clk_divider_tb/uut/counter\
sim:/Integer_clk_divider_tb/uut/e_div \
sim:/Integer_clk_divider_tb/uut/o_div
run -all