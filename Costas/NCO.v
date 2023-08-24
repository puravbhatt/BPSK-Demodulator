`include "tables.v"

module NCO ( reset, clk, error, sinterm, costerm, data_out );

	input clk, reset;
	input [31:0] error;
	output [15:0] sinterm, costerm;
	output reg [31:0] data_out;
	
	reg [31:0] data_out_d;
	wire [31:0] out;
	wire [9:0] angle;
	always @(posedge clk) begin
		if(reset)
			data_out <= 0;
		else
			data_out <= data_out_d + (error<<3);
	   end
	   
	assign angle = data_out_d[31:22];
	assign out =  scTable(angle);
	assign sinterm = out[31:16];
	assign costerm = out[15:0];
	
endmodule
	