onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb_100/clk
add wave -noupdate /top_tb_100/rst_n
add wave -noupdate -radix unsigned /top_tb_100/img_idx
add wave -noupdate -radix hexadecimal /top_tb_100/data_in
add wave -noupdate -radix unsigned /top_tb_100/cnt
add wave -noupdate -radix unsigned /top_tb_100/input_cnt
add wave -noupdate -radix unsigned /top_tb_100/rand_num
add wave -noupdate /top_tb_100/state
add wave -noupdate -radix unsigned /top_tb_100/i_cnt
add wave -noupdate -radix unsigned /top_tb_100/accuracy
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv_out_1
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv_out_2
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv_out_3
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv2_out_1
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv2_out_2
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/conv2_out_3
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max_value_1
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max_value_2
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max_value_3
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max2_value_1
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max2_value_2
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/max2_value_3
add wave -noupdate -group conv -radix hexadecimal /top_tb_100/fc_out_data
add wave -noupdate -radix unsigned /top_tb_100/decision
add wave -noupdate /top_tb_100/valid_out_1
add wave -noupdate /top_tb_100/valid_out_2
add wave -noupdate /top_tb_100/valid_out_3
add wave -noupdate /top_tb_100/valid_out_4
add wave -noupdate /top_tb_100/valid_out_5
add wave -noupdate /top_tb_100/valid_out_6
add wave -noupdate /top_tb_100/comparator/clk
add wave -noupdate /top_tb_100/comparator/rst_n
add wave -noupdate /top_tb_100/comparator/valid_in
add wave -noupdate /top_tb_100/comparator/data_in
add wave -noupdate /top_tb_100/comparator/decision
add wave -noupdate /top_tb_100/comparator/valid_out
add wave -noupdate -radix unsigned /top_tb_100/comparator/max
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp1_0
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp1_1
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp1_2
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp1_3
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp1_4
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp2_0
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp2_1
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp2_2
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp3_0
add wave -noupdate -radix unsigned /top_tb_100/comparator/cmp3_1
add wave -noupdate -radix unsigned /top_tb_100/comparator/buf_idx
add wave -noupdate -radix unsigned /top_tb_100/comparator/delay_cnt
add wave -noupdate /top_tb_100/comparator/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 233
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
WaveRestoreZoom {12646 ps} {14105 ps}
