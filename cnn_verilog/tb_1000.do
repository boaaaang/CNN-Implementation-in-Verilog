onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb_1000/clk
add wave -noupdate /top_tb_1000/rst_n
add wave -noupdate -radix unsigned /top_tb_1000/img_idx
add wave -noupdate /top_tb_1000/data_in
add wave -noupdate -radix unsigned /top_tb_1000/cnt
add wave -noupdate -radix unsigned /top_tb_1000/input_cnt
add wave -noupdate -radix unsigned /top_tb_1000/rand_num
add wave -noupdate /top_tb_1000/state
add wave -noupdate -radix unsigned /top_tb_1000/i_cnt
add wave -noupdate /top_tb_1000/accuracy
add wave -noupdate -radix hexadecimal /top_tb_1000/conv_out_1
add wave -noupdate -radix hexadecimal /top_tb_1000/conv_out_2
add wave -noupdate -radix hexadecimal /top_tb_1000/conv_out_3
add wave -noupdate -radix hexadecimal /top_tb_1000/max_value_1
add wave -noupdate -radix hexadecimal /top_tb_1000/max_value_2
add wave -noupdate -radix hexadecimal /top_tb_1000/max_value_3
add wave -noupdate -radix hexadecimal /top_tb_1000/conv2_out_1
add wave -noupdate -radix hexadecimal /top_tb_1000/conv2_out_2
add wave -noupdate -radix hexadecimal /top_tb_1000/conv2_out_3
add wave -noupdate -radix hexadecimal /top_tb_1000/max2_value_1
add wave -noupdate -radix hexadecimal /top_tb_1000/max2_value_2
add wave -noupdate -radix hexadecimal /top_tb_1000/max2_value_3
add wave -noupdate -radix hexadecimal /top_tb_1000/fc_out_data
add wave -noupdate -radix unsigned /top_tb_1000/decision
add wave -noupdate /top_tb_1000/valid_out_1
add wave -noupdate /top_tb_1000/valid_out_2
add wave -noupdate /top_tb_1000/valid_out_3
add wave -noupdate /top_tb_1000/valid_out_4
add wave -noupdate /top_tb_1000/valid_out_5
add wave -noupdate /top_tb_1000/valid_out_6
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 281
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {12646 ps} {14042 ps}
