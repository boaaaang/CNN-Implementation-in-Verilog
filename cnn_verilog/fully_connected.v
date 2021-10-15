/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : fully_connected.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 13, 2021
 *  Version    : 21.2
 *  Design     : Fully Connected Layer for CNN
 *
 *------------------------------------------------------------------------*/

/*-------------------------------------------------------------------
 *  Module: fully_connected
 *------------------------------------------------------------------*/

 module fully_connected #(parameter INPUT_NUM = 48, OUTPUT_NUM = 10, DATA_BITS = 8) (
   input clk,
   input rst_n,
   input valid_in,
   input signed [11:0] data_in_1, data_in_2, data_in_3,
   output reg [11:0] data_out,
   output reg valid_out_fc
 );

 localparam INPUT_WIDTH = 16;
 localparam INPUT_NUM_DATA_BITS = 5;

 reg state;
 reg [INPUT_WIDTH - 1:0] buf_idx;
 reg [3:0] out_idx;
 reg signed [13:0] buffer [0:INPUT_NUM - 1];
 reg signed [DATA_BITS - 1:0] weight [0:INPUT_NUM * OUTPUT_NUM - 1];
 reg signed [DATA_BITS - 1:0] bias [0:OUTPUT_NUM - 1];
   
 wire signed [19:0] calc_out;
 wire signed [13:0] data1, data2, data3;

 initial begin
   $readmemh("fc_weight.txt", weight);
   $readmemh("fc_bias.txt", bias);
 end

 assign data1 = (data_in_1[11] == 1) ? {2'b11, data_in_1} : {2'b00, data_in_1};
 assign data2 = (data_in_2[11] == 1) ? {2'b11, data_in_2} : {2'b00, data_in_2};
 assign data3 = (data_in_3[11] == 1) ? {2'b11, data_in_3} : {2'b00, data_in_3};
 
 always @(posedge clk) begin
   if(~rst_n) begin
     valid_out_fc <= 0;
     buf_idx <= 0;
     out_idx <= 0;
     state <= 0;
   end

   if(valid_out_fc == 1) begin
     valid_out_fc <= 0;
   end

   if(valid_in == 1) begin
     // Wait until 48 input data filled in buffer
     if(!state) begin
       buffer[buf_idx] <= data1;
       buffer[INPUT_WIDTH + buf_idx] <= data2;
       buffer[INPUT_WIDTH * 2 + buf_idx] <= data3;
       buf_idx <= buf_idx + 1'b1;
       if(buf_idx == INPUT_WIDTH - 1) begin
         buf_idx <= 0;
         state <= 1;
         valid_out_fc <= 1;
       end
     end else begin // valid state
       out_idx <= out_idx + 1'b1;
       if(out_idx == OUTPUT_NUM - 1) begin
         out_idx <= 0;
       end
       valid_out_fc <= 1;
     end
   end
 end

 assign calc_out = weight[out_idx * INPUT_NUM] * buffer[0] + weight[out_idx * INPUT_NUM + 1] * buffer[1] + 
		  		weight[out_idx * INPUT_NUM + 2] * buffer[2] + weight[out_idx * INPUT_NUM + 3] * buffer[3] + 
  				weight[out_idx * INPUT_NUM + 4] * buffer[4] + weight[out_idx * INPUT_NUM + 5] * buffer[5] + 
	  			weight[out_idx * INPUT_NUM + 6] * buffer[6] + weight[out_idx * INPUT_NUM + 7] * buffer[7] + 
		  		weight[out_idx * INPUT_NUM + 8] * buffer[8] + weight[out_idx * INPUT_NUM + 9] * buffer[9] + 
  				weight[out_idx * INPUT_NUM + 10] * buffer[10] + weight[out_idx * INPUT_NUM + 11] * buffer[11] + 
  				weight[out_idx * INPUT_NUM + 12] * buffer[12] + weight[out_idx * INPUT_NUM + 13] * buffer[13] + 
	  			weight[out_idx * INPUT_NUM + 14] * buffer[14] + weight[out_idx * INPUT_NUM + 15] * buffer[15] + 
  				weight[out_idx * INPUT_NUM + 16] * buffer[16] + weight[out_idx * INPUT_NUM + 17] * buffer[17] + 
  				weight[out_idx * INPUT_NUM + 18] * buffer[18] + weight[out_idx * INPUT_NUM + 19] * buffer[19] + 
  				weight[out_idx * INPUT_NUM + 20] * buffer[20] + weight[out_idx * INPUT_NUM + 21] * buffer[21] + 
  				weight[out_idx * INPUT_NUM + 22] * buffer[22] + weight[out_idx * INPUT_NUM + 23] * buffer[23] + 
  				weight[out_idx * INPUT_NUM + 24] * buffer[24] + weight[out_idx * INPUT_NUM + 25] * buffer[25] + 
  				weight[out_idx * INPUT_NUM + 26] * buffer[26] + weight[out_idx * INPUT_NUM + 27] * buffer[27] + 
  				weight[out_idx * INPUT_NUM + 28] * buffer[28] + weight[out_idx * INPUT_NUM + 29] * buffer[29] + 
  				weight[out_idx * INPUT_NUM + 30] * buffer[30] + weight[out_idx * INPUT_NUM + 31] * buffer[31] + 
  				weight[out_idx * INPUT_NUM + 32] * buffer[32] + weight[out_idx * INPUT_NUM + 33] * buffer[33] + 
  				weight[out_idx * INPUT_NUM + 34] * buffer[34] + weight[out_idx * INPUT_NUM + 35] * buffer[35] + 
  				weight[out_idx * INPUT_NUM + 36] * buffer[36] + weight[out_idx * INPUT_NUM + 37] * buffer[37] + 
  				weight[out_idx * INPUT_NUM + 38] * buffer[38] + weight[out_idx * INPUT_NUM + 39] * buffer[39] + 
	  			weight[out_idx * INPUT_NUM + 40] * buffer[40] + weight[out_idx * INPUT_NUM + 41] * buffer[41] + 
	  			weight[out_idx * INPUT_NUM + 42] * buffer[42] + weight[out_idx * INPUT_NUM + 43] * buffer[43] + 
	  			weight[out_idx * INPUT_NUM + 44] * buffer[44] + weight[out_idx * INPUT_NUM + 45] * buffer[45] + 
  				weight[out_idx * INPUT_NUM + 46] * buffer[46] + weight[out_idx * INPUT_NUM + 47] * buffer[47] + 
  				bias[out_idx];
 assign data_out = calc_out[18:7];

 endmodule