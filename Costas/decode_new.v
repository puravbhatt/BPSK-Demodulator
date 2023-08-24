module decode( 
	input clk, reset,
	input [9:0] data_in,
	output reg [7:0] data_out
	);

        reg [5:0] data_in_65;
	reg [3:0] data_in_43;
	reg [4:0] data_out_65;
	reg [2:0] data_out_43;
	
	assign data_in_65 = data_in[5:0];
	assign data_in_43 = data_in[9:6];
	
    always @(posedge clk)
		begin
			if(reset) begin
				data_out <= 0;
                                data_out_43 <= 0;
                                data_out_65 <= 0;
			end
			
		    else begin
			     
				data_out_43 <= decoder4_3(data_in_43);
				data_out_65 <= decoder6_5(data_in_65);
			        data_out[4:0] <= data_out_65;
	                        data_out[7:5] <= data_out_43;
			end
		end
	
	
function [4:0] decoder6_5;
	input [5:0] data_in;
	begin
	
	case (data_in)
		6'b111001 : decoder6_5 = 5'b00000;
		6'b101110 : decoder6_5 = 5'b00001;
		6'b101101 : decoder6_5 = 5'b00010;
		6'b100011 : decoder6_5 = 5'b00011;
		6'b101011 : decoder6_5 = 5'b00100;
		6'b100101 : decoder6_5 = 5'b00101;
		6'b100110 : decoder6_5 = 5'b00110;
		6'b000111 : decoder6_5 = 5'b00111;
		6'b100111 : decoder6_5 = 5'b01000;
		6'b101001 : decoder6_5 = 5'b01001;
		6'b101010 : decoder6_5 = 5'b01010;
		6'b001011 : decoder6_5 = 5'b01011;
		6'b101100 : decoder6_5 = 5'b01100;
		6'b001101 : decoder6_5 = 5'b01101;
		6'b001110 : decoder6_5 = 5'b01110;
		6'b111010 : decoder6_5 = 5'b01111;
		6'b110110 : decoder6_5 = 5'b10000;
		6'b110001 : decoder6_5 = 5'b10001;
		6'b110010 : decoder6_5 = 5'b10010;
		6'b010011 : decoder6_5 = 5'b10011;
		6'b110100 : decoder6_5 = 5'b10100;
		6'b010101 : decoder6_5 = 5'b10101;
		6'b010110 : decoder6_5 = 5'b10110;
		6'b010111 : decoder6_5 = 5'b10111; 
		6'b110011 : decoder6_5 = 5'b11000;
		6'b011001 : decoder6_5 = 5'b11001;
		6'b011010 : decoder6_5 = 5'b11010;
		6'b011011 : decoder6_5 = 5'b11011;
		6'b011100 : decoder6_5 = 5'b11100;
		6'b011101 : decoder6_5 = 5'b11101;
		6'b011110 : decoder6_5 = 5'b11110;
		6'b110101 : decoder6_5 = 5'b11111;
		
		6'b000110 : decoder6_5 = 5'b00000;
		6'b010001 : decoder6_5 = 5'b00001;
		6'b010010 : decoder6_5 = 5'b00010;
		6'b010100 : decoder6_5 = 5'b00100;
		6'b111000 : decoder6_5 = 5'b00111;
		6'b011000 : decoder6_5 = 5'b01000;
		6'b000101 : decoder6_5 = 5'b01111;
		6'b001001 : decoder6_5 = 5'b10000;
		6'b101000 : decoder6_5 = 5'b10111;
		6'b001100 : decoder6_5 = 5'b11000;
		6'b100100 : decoder6_5 = 5'b11011;
		6'b100010 : decoder6_5 = 5'b11101;
		6'b100001 : decoder6_5 = 5'b11110;
		6'b001010 : decoder6_5 = 5'b11111;
	endcase
	end
endfunction

function [2:0] decoder4_3;
	input [3:0] data_input;
	begin
	
	case (data_input)
		4'b1101 : decoder4_3 = 3'b000;
		4'b1001 : decoder4_3 = 3'b001;
		4'b1010 : decoder4_3 = 3'b010;
		4'b0011 : decoder4_3 = 3'b011;
		4'b1011 : decoder4_3 = 3'b100;
		4'b0101 : decoder4_3 = 3'b101;
		4'b0110 : decoder4_3 = 3'b110;
		4'b0111 : decoder4_3 = 3'b111;
		
		4'b1110 : decoder4_3 = 3'b111;
		4'b0010 : decoder4_3 = 3'b000;
		4'b1100 : decoder4_3 = 3'b011;
		4'b0100 : decoder4_3 = 3'b100;
		4'b1000 : decoder4_3 = 3'b111;
		4'b0001 : decoder4_3 = 3'b111;
	endcase
	end
endfunction


endmodule