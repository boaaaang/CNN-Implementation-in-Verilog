
/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : relu.v
 *  Written by : Kang, Bo Young
 *  Written on : Sep 30, 2021
 *  Version    : 21.1
 *  Design     : Activation Function for CNN - ReLU Function
 *
 *------------------------------------------------------------------------*/

`timescale 1ns/1ns

/*-------------------------------------------------------------------
 *  Module: relu
 *------------------------------------------------------------------*/

module relu #(parameter CONV_BIT = 12){
	input clk;
	input rst_n;	// asynchronous reset, active low
	input valid_in;
	input signed [CONV_BIT - 1 : 0] conv_out_1, conv_out_2, conv_out_3;
	output reg [CONV_BIT - 1 : 0] max_value_1, max_value_2, max_value_3;
	output reg valid_out;
};

always @(posedge clk) begin
	if(~rst_n) begin
		valid_out <= 0;
	end

	if(valid_in == 1'b1) begin

	end
end