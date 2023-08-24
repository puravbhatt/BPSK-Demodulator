module filter(data_in, data_out, clk, reset);
	input clk, reset;
	input [31:0] data_in;
	output [31:0] data_out;
	integer i;
	
	reg signed [31:0] taps[0:42];
	reg signed [31:0] buffs[0:42];
	reg signed [63:0] acc[0:42];
	reg signed [63:0] ans;
	
	assign		taps[0]= 32'd2; 
	assign		taps[1]=32'd4;
	assign		taps[2]=32'd4;
	assign		taps[3]=32'd2;
	assign		taps[4]=-32'd3;
	assign		taps[5]=-32'd10;
	assign		taps[6]=-32'd14;
	assign		taps[7]=-32'd14;
	assign		taps[8]=-32'd6;
	assign		taps[9]=32'd7;
	assign		taps[10]=32'd19;
	assign		taps[11]= 32'd22;
	assign		taps[12]=32'd12;
	assign		taps[13]=-32'd11;
	assign		taps[14]=-32'd36;
	assign		taps[15]=-32'd48;
	assign		taps[16]=-32'd35;
	assign		taps[17]=32'd11;
	assign		taps[18]=32'd83;
	assign		taps[19]=32'd161;
	assign		taps[20]=32'd221;
	assign		taps[21]=32'd244;
	assign		taps[22]=32'd221;
	assign		taps[23]=32'd161;
	assign		taps[24]=32'd83;
	assign		taps[25]=32'd11;
	assign		taps[26]=-32'd35;
	assign		taps[27]=-32'd48;
	assign		taps[28]=-32'd36;
	assign		taps[29]=-32'd11;
	assign		taps[30]=32'd12;
	assign		taps[31]=32'd22;
	assign		taps[32]=32'd19;
	assign		taps[33]=32'd7;
	assign		taps[34]=32'd6;
	assign		taps[35]=-32'd14;
	assign		taps[36]=-32'd14;
	assign		taps[37]=-32'd10;
	assign		taps[38]=-32'd3;
	assign		taps[39]=32'd2;
	assign		taps[40]=32'd4;
	assign		taps[41]=32'd4;
	assign		taps[42]=32'd2;
		end
		
		always @(posedge clk) begin
				if(reset)
					begin					
					OP[0] <= 0;
					OP[1] <= 0;
					OP[2] <= 0;
					OP[3] <= 0;
					OP[4] <= 0;
					OP[5] <= 0;
					OP[6] <= 0;
					OP[7] <= 0;
					OP[8] <= 0;
					OP[9] <= 0;
					OP[10] <= 0;
					OP[11] <= 0;
					OP[12] <= 0;
					OP[13] <= 0;
					OP[14] <= 0;
					OP[15] <= 0;
					OP[16] <= 0;
					OP[17] <= 0;
					OP[18] <= 0;
					OP[19] <= 0;
					OP[20] <= 0;
					OP[21] <= 0;
					OP[22] <= 0;
					OP[23] <= 0;
					OP[24] <= 0;
					OP[25] <= 0;
					OP[26] <= 0;
					OP[27] <= 0;
					OP[28] <= 0;
					OP[29] <= 0;
					OP[30] <= 0;
					OP[31] <= 0;
					OP[32] <= 0;
					OP[33] <= 0;
					OP[34] <= 0;
					OP[35] <= 0;
					OP[36] <= 0;
					OP[37] <= 0;
					OP[38] <= 0;
					OP[39] <= 0;
					OP[40] <= 0;
					OP[41] <= 0;
					OP[42] <= 0;
					end
				else begin
					OP[0] <= buffs[0]*taps[0];
					OP[1] <= buffs[1]*taps[1];
					OP[2] <= buffs[2]*taps[2];
					OP[3] <= buffs[3]*taps[3];
					OP[4] <= buffs[4]*taps[4];
					OP[5] <= buffs[5]*taps[5];
					OP[6] <= buffs[6]*taps[6];
					OP[7] <= buffs[7]*taps[7];
					OP[8] <= buffs[8]*taps[8];
					OP[9] <= buffs[9]*taps[9];
					OP[10] <= buffs[10]*taps[10];
					OP[11] <= buffs[11]*taps[11];
					OP[12] <= buffs[12]*taps[12];
					OP[13] <= buffs[13]*taps[13];
					OP[14] <= buffs[14]*taps[14];
					OP[15] <= buffs[15]*taps[15];
					OP[16] <= buffs[16]*taps[16];
					OP[17] <= buffs[17]*taps[17];
					OP[18] <= buffs[18]*taps[18];
					OP[19] <= buffs[19]*taps[19];
					OP[20] <= buffs[20]*taps[20];
					OP[21] <= buffs[21]*taps[21];
					OP[22] <= buffs[22]*taps[22];
					OP[23] <= buffs[23]*taps[23];
					OP[24] <= buffs[24]*taps[24];
					OP[25] <= buffs[25]*taps[25];
					OP[26] <= buffs[26]*taps[26];
					OP[27] <= buffs[27]*taps[27];
					OP[28] <= buffs[28]*taps[28];
					OP[29] <= buffs[29]*taps[29];
					OP[30] <= buffs[30]*taps[30];
					OP[31] <= buffs[31]*taps[31];
					OP[32] <= buffs[32]*taps[32];
					OP[33] <= buffs[33]*taps[33];
					OP[34] <= buffs[34]*taps[34];
					OP[35] <= buffs[35]*taps[35];
					OP[36] <= buffs[36]*taps[36];
					OP[37] <= buffs[37]*taps[37];
					OP[38] <= buffs[38]*taps[38];
					OP[39] <= buffs[39]*taps[39];
					OP[40] <= buffs[40]*taps[40];
					OP[41] <= buffs[41]*taps[41];
					OP[42] <= buffs[42]*taps[42];
					end
			end	
			
			always @(posedge clk)
				begin
				    if (reset) begin
					buffs[0] <= 0;
					buffs[1] <= 0;
					buffs[2] <= 0;
					buffs[3] <= 0;
					buffs[4] <= 0;
					buffs[5] <= 0;
					buffs[6] <= 0;
					buffs[7] <= 0;
					buffs[8] <= 0;
					buffs[9] <= 0;
					buffs[10] <= 0;
					buffs[11] <= 0;
					buffs[12] <= 0;
					buffs[13] <= 0;
					buffs[14] <= 0;
					buffs[15] <= 0;
					buffs[16] <= 0;
					buffs[17] <= 0;
					buffs[18] <= 0;
					buffs[19] <= 0;
					buffs[20] <= 0;
					buffs[21] <= 0;
					buffs[22] <= 0;
					buffs[23] <= 0;
					buffs[24] <= 0;
					buffs[25] <= 0;
					buffs[26] <= 0;
					buffs[27] <= 0;
					buffs[28] <= 0;
					buffs[29] <= 0;
					buffs[30] <= 0;
					buffs[31] <= 0;
					buffs[32] <= 0;
			        buffs[33] <= 0;
					buffs[34] <= 0;
					buffs[35] <= 0;
					buffs[36] <= 0;
					buffs[37] <= 0;
					buffs[38] <= 0;
					buffs[39] <= 0;
					buffs[40] <= 0;
					buffs[41] <= 0;
					buffs[42] <= 0;
				end
				else begin
					buffs[0] <= data_in;
					buffs[1] <= buffs[0];
					buffs[2] <= buffs[1];
					buffs[3] <= buffs[2];
					buffs[4] <= buffs[3];
					buffs[5] <= buffs[4];
					buffs[6] <= buffs[5];
					buffs[7] <= buffs[6];
					buffs[8] <= buffs[7];
					buffs[9] <= buffs[8];
					buffs[10] <= buffs[9];
					buffs[11] <= buffs[10];
					buffs[12] <= buffs[11];
					buffs[13] <= buffs[12];
					buffs[14] <= buffs[13];
					buffs[15] <= buffs[14];
					buffs[16] <= buffs[15];
					buffs[17] <= buffs[16];
					buffs[18] <= buffs[17];
					buffs[19] <= buffs[18];
					buffs[20] <= buffs[19];
					buffs[21] <= buffs[20];
					buffs[22] <= buffs[21];
					buffs[23] <= buffs[22];
					buffs[24] <= buffs[23];
					buffs[25] <= buffs[24];
					buffs[26] <= buffs[25];
					buffs[27] <= buffs[26];
					buffs[28] <= buffs[27];
					buffs[29] <= buffs[28];
					buffs[30] <= buffs[29];
					buffs[31] <= buffs[30];
					buffs[32] <= buffs[31];
			        buffs[33] <= buffs[32];
					buffs[34] <= buffs[33];
					buffs[35] <= buffs[34];
					buffs[36] <= buffs[35];
					buffs[37] <= buffs[36];
					buffs[38] <= buffs[37];
					buffs[39] <= buffs[38];
					buffs[40] <= buffs[39];
					buffs[41] <= buffs[40];
					buffs[42] <= buffs[41];
					end
			end
			
			
			always @(*)
				begin
				acc[0] <= OP[0];
				for(i=1; i<43; i++)
				{
					acc[i] = OP[i] + acc[i-1];
				}
				end
				
				assign ans = acc[42];
				assign data_out = ans[39:8];
	endmodule	