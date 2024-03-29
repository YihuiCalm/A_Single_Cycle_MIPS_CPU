`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 07:08:07 PM
// Design Name: 
// Module Name: data_MEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_MEM(
	input clk,
	input [31:0] read_addr,
	input [31:0] write_addr,
	input [31:0] write_data,
	input read_enable,
	input write_enable,
	
	output [31:0] read_data
    );
    
    reg [31:0] data [31:0];
    
    initial begin
    	data[0] = 32'h1;
    	data[1] = 32'h2;
    	data[2] = 32'h3;
    end

    always @(posedge clk) begin
		if (write_enable) begin
    		data[write_addr] <= write_data;
    	end
    end
    
    assign read_data = read_enable? data[read_addr]: 0;
    
endmodule
