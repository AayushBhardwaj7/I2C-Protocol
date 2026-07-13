`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 06:18:59
// Design Name: 
// Module Name: I2C_top_tb
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


module I2C_top_tb( );

reg mast_rst, slave_reset;
reg [7:0]slave_data;
reg  mast_start_bit, mast_rd_wr;
reg  fpga_clk=0;
reg [7:0]mast_data;
reg [6:0]mast_address;

wire [7:0]slave_data_out;
wire [7:0]data_from_slave;

I2C_top TopI2C(	slave_reset,
				slave_data_out, 
				slave_data, 
				mast_start_bit, 
				fpga_clk, 
				mast_rd_wr,
   	 			mast_address, 
   	 			mast_data, 
   	 			mast_rst, 
   	 			data_from_slave
   	 		  );
   	 		  
//always #4 fpga_clk=~fpga_clk;
always #10 fpga_clk=~fpga_clk;
//always #5 fpga_clk=~fpga_clk;

initial begin
	mast_rst=0;slave_reset=0;
	#4500 mast_rst=1;slave_reset=1;
end 

initial begin
	mast_data=8'b1111_0000; mast_rd_wr=0;mast_start_bit=1;mast_address=7'b1111010;
	slave_data=8'b0000_1111;
	#180000 mast_start_bit=0;
end

endmodule
