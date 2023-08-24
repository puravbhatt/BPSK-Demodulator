`include "NCO.v"
`include "multiplication.v"                        //including the components of the Costas loop in the top module
`include "filter.v"
`include "sync.v"


module costas( ADC, clk, reset, PushADC, pushByte, Sync, lastByte, stopIn, Byte);
	input clk, reset, PushADC, stopIn;
	input [9:0] ADC;                                       // Input is 10 bit ADC values 
	output reg pushByte, Sync, lastByte;
	output reg [7:0] Byte;                                  //Output is 8 bit decoded output from 10/8 decoding
	
	wire [31:0] phase, product1, product2, LPF1, LPF2, data_out, in;
	wire [15:0] sine_value, cosine_value;	
	wire [7:0] out, read_ad, write_ad, fifo;
	wire match, empty, full;
	wire [1:0] ctr;
	
	NCO instance1( .clk(clk), .reset(reset), .error(phase), .data_out(data_out), .sinterm(sine_value), .costerm(cosine_value));
	//This is the NCO module that gets the input as the phase error. The NCO converts that phase value to the corresponding sine and cosine values from the sine table.
	
	multiplication instance2 (.reset(reset), .clk(clk), .ADC({{23{ADC[9]}}, ADC[8:0]}}), .trigval({{17{sine_value[15]}}, sine_value[14:0]}), .data_out(product1));
	multiplication instance3 (.reset(reset), .clk(clk), .ADC({{23{ADC[9]}}, ADC[8:0]}}), .trigval({{17{cosine_value[15]}}, cosine_value[14:0]}), .data_out(product2));
	//These are the multiplication modules that multiply corresponding signals. The first module multiplies the lower portion of the costas loop, i.e. the incoming ADC value with the sine value.
	//The second module multiplies the upper portion i.e. the incoming ADC value with the cosine value. 
	
	filter instance4(.reset(reset), .clk(clk), .data_in(product1), .data_out(LPF1));
	filter instance5(.reset(reset), .clk(clk), .data_in(product2), .data_out(LPF2));
	//These are the filter modules that act as low pass filters. These filters eliminate the residual of the sum term.
	
	multiplication instance6(.reset(reset), .clk(clk), .ADC(LPF1), trigval(LPF2), data_out(phase));
	//This module multiplies the output of both the filters and gives the corresponding phase value.
	
	synchronizer instance7(.reset(reset), .clk(clk), .data_in(in), .data_out(out), .sync(match));
	//This is a synchronizer module that matches the output of the costas loop with the FIFO.
	
	fifo instance8( .reset(reset), .clk(clk), .pushByte(pushByte), .stopIn(stopIn), .dataIn_sync(Sync), .lastByte(lastByte), .ctr(ctr), .empty(empty), .full(full), .read_ad(read_ad), .write_ad(write_ad), .fifo(fifo));
	//This is size 8 FIFO that takes input from the synchronizer and gives the data to the decoder
	
	decode instance9( .reset(reset), .clk(clk), .data_in(fifo), .data_out(Byte));
	//This is the decoder that decoder that performs 10/8 decoding.
	
endmodule