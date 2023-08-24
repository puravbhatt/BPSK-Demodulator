module multiplication( clk, reset, ADC, trig_val, data_out);
	input clk, reset;
	input [31:0] ADC, trig_val;
	output reg signed [31:0] data_out;
	
	always @(*) begin
		data_out = ADC*trig_val;
	end
endmodule



