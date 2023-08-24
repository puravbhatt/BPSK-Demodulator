module synchronizer(reset, clk, data_in, data_out, sync);
	input clk, reset;
	input [31:0] data_in;
	output reg [7:0] data_out;
	output reg sync;
	
	reg signed [31:0] buffs[0:99];
	reg signed [31:0] OP1[0:99];
	reg signed [31:0] OP2[0:19];
	reg signed [31:0] OP3[0:3];
	reg signed [31:0] OP4;
	integer i,j,k,l,m;
	
	always @(posedge clk) begin
			if(reset) begin
				for(i=0; i<500; i=i+1) begin
					buffs[i] <= 0;
				end
			end
			
			else begin
			    buffs[0] <= data_in;
				for(j=1; j<500, j=j+1) begin
					buffs[j] <= buffs[j-1];
				end
			end
	end
				
	always @(posedge clk) begin
			if(reset) begin
				for(k=0; k<100; k=k+1) begin
					OP1[k] <= 0;
				end
			end
			
			else begin
				OP1[0] <=  buffs[0]+buffs[1]+buffs[2]+buffs[3]+buffs[4];
				OP1[1] <=  buffs[5]+buffs[6]+buffs[7]+buffs[8]+buffs[9];
				OP1[2] <=  buffs[10]+buffs[11]+buffs[12]+buffs[13]+buffs[14];
				OP1[3] <=  buffs[15]+buffs[16]+buffs[17]+buffs[18]+buffs[19];
				OP1[4] <=  buffs[20]+buffs[21]+buffs[22]+buffs[23]+buffs[24];
				OP1[5] <=  buffs[25]+buffs[26]+buffs[27]+buffs[28]+buffs[29];
				OP1[6] <=  buffs[30]+buffs[31]+buffs[32]+buffs[33]+buffs[34];
				OP1[7] <=  buffs[35]+buffs[36]+buffs[37]+buffs[38]+buffs[39];
				OP1[8] <=  buffs[40]+buffs[41]+buffs[42]+buffs[43]+buffs[44];
				OP1[9] <=  buffs[45]+buffs[46]+buffs[47]+buffs[48]+buffs[49];
				OP1[10] <=  buffs[50]+buffs[51]+buffs[52]+buffs[53]+buffs[54];
				OP1[11] <=  buffs[55]+buffs[56]+buffs[57]+buffs[58]+buffs[59];
				OP1[12] <=  buffs[60]+buffs[61]+buffs[62]+buffs[63]+buffs[64];
				OP1[13] <=  buffs[65]+buffs[66]+buffs[67]+buffs[68]+buffs[69];
				OP1[14] <=  buffs[70]+buffs[71]+buffs[72]+buffs[73]+buffs[74];
				OP1[15] <=  buffs[75]+buffs[76]+buffs[77]+buffs[78]+buffs[79];
				OP1[16] <=  buffs[80]+buffs[81]+buffs[82]+buffs[83]+buffs[84];
				OP1[17] <=  buffs[85]+buffs[86]+buffs[87]+buffs[88]+buffs[89];
				OP1[18] <=  buffs[90]+buffs[91]+buffs[92]+buffs[93]+buffs[94];
				OP1[19] <=  buffs[95]+buffs[96]+buffs[97]+buffs[98]+buffs[99];
				OP1[25] <=  buffs[125]+buffs[126]+buffs[127]+buffs[128]+buffs[129];
				OP1[26] <=  buffs[130]+buffs[131]+buffs[132]+buffs[133]+buffs[134];
				OP1[27] <=  buffs[135]+buffs[136]+buffs[137]+buffs[138]+buffs[139];
				OP1[28] <=  buffs[140]+buffs[141]+buffs[142]+buffs[143]+buffs[144];
				OP1[29] <=  buffs[145]+buffs[146]+buffs[147]+buffs[148]+buffs[149];
				OP1[30] <=  buffs[150]+buffs[151]+buffs[152]+buffs[153]+buffs[154];
				OP1[31] <=  buffs[155]+buffs[156]+buffs[157]+buffs[158]+buffs[159];
				OP1[32] <=  buffs[160]+buffs[161]+buffs[162]+buffs[163]+buffs[164];
				OP1[33] <=  buffs[165]+buffs[166]+buffs[167]+buffs[168]+buffs[169];
				OP1[34] <=  buffs[170]+buffs[171]+buffs[172]+buffs[173]+buffs[174];
				OP1[35] <=  buffs[175]+buffs[176]+buffs[177]+buffs[178]+buffs[179];
				OP1[36] <=  buffs[180]+buffs[181]+buffs[182]+buffs[183]+buffs[184];
				OP1[37] <=  buffs[185]+buffs[186]+buffs[187]+buffs[188]+buffs[189];
				OP1[38] <=  buffs[190]+buffs[191]+buffs[192]+buffs[193]+buffs[194];
				OP1[39] <=  buffs[195]+buffs[196]+buffs[197]+buffs[198]+buffs[199];
				OP1[40] <=  buffs[200]+buffs[201]+buffs[202]+buffs[203]+buffs[204];
				OP1[41] <=  buffs[205]+buffs[206]+buffs[207]+buffs[208]+buffs[209];
				OP1[42] <=  buffs[210]+buffs[211]+buffs[212]+buffs[213]+buffs[214];
				OP1[43] <=  buffs[215]+buffs[216]+buffs[217]+buffs[218]+buffs[219];
				OP1[44] <=  buffs[220]+buffs[221]+buffs[222]+buffs[223]+buffs[224];
				OP1[45] <=  buffs[225]+buffs[226]+buffs[227]+buffs[228]+buffs[229];
				OP1[46] <=  buffs[230]+buffs[231]+buffs[232]+buffs[233]+buffs[234];
				OP1[47] <=  buffs[235]+buffs[236]+buffs[237]+buffs[238]+buffs[239];
				OP1[48] <=  buffs[240]+buffs[241]+buffs[242]+buffs[243]+buffs[244];
				OP1[49] <=  buffs[245]+buffs[246]+buffs[247]+buffs[248]+buffs[249];
				OP1[50] <=  buffs[250]+buffs[251]+buffs[252]+buffs[253]+buffs[254];
				OP1[51] <=  buffs[255]+buffs[256]+buffs[257]+buffs[258]+buffs[259];
				OP1[52] <=  buffs[260]+buffs[261]+buffs[262]+buffs[263]+buffs[264];
				OP1[53] <=  buffs[265]+buffs[266]+buffs[267]+buffs[268]+buffs[269];
				OP1[54] <=  buffs[270]+buffs[271]+buffs[272]+buffs[273]+buffs[274];
				OP1[55] <=  buffs[275]+buffs[276]+buffs[277]+buffs[278]+buffs[279];
				OP1[56] <=  buffs[280]+buffs[281]+buffs[282]+buffs[283]+buffs[284];
				OP1[57] <=  buffs[285]+buffs[286]+buffs[287]+buffs[288]+buffs[289];
				OP1[58] <=  buffs[290]+buffs[291]+buffs[292]+buffs[293]+buffs[294];
				OP1[59] <=  buffs[295]+buffs[296]+buffs[297]+buffs[298]+buffs[299];
				OP1[60] <=  buffs[300]+buffs[301]+buffs[302]+buffs[303]+buffs[304];
				OP1[61] <=  buffs[305]+buffs[306]+buffs[307]+buffs[308]+buffs[309];
				OP1[62] <=  buffs[310]+buffs[311]+buffs[312]+buffs[313]+buffs[314];
				OP1[63] <=  buffs[315]+buffs[316]+buffs[317]+buffs[318]+buffs[319];
				OP1[64] <=  buffs[320]+buffs[321]+buffs[322]+buffs[323]+buffs[324];
				OP1[65] <=  buffs[325]+buffs[326]+buffs[327]+buffs[328]+buffs[329];
				OP1[66] <=  buffs[330]+buffs[331]+buffs[332]+buffs[333]+buffs[334];
				OP1[67] <=  buffs[335]+buffs[336]+buffs[337]+buffs[338]+buffs[339];
				OP1[68] <=  buffs[340]+buffs[341]+buffs[342]+buffs[343]+buffs[344];
				OP1[69] <=  buffs[345]+buffs[346]+buffs[347]+buffs[348]+buffs[349];
				OP1[75] <=  buffs[375]+buffs[376]+buffs[377]+buffs[378]+buffs[379];
				OP1[76] <=  buffs[380]+buffs[381]+buffs[382]+buffs[383]+buffs[384];
				OP1[77] <=  buffs[385]+buffs[386]+buffs[387]+buffs[388]+buffs[389];
				OP1[78] <=  buffs[390]+buffs[391]+buffs[392]+buffs[393]+buffs[394];
				OP1[79] <=  buffs[395]+buffs[396]+buffs[397]+buffs[398]+buffs[399];
				OP1[80] <=  buffs[400]+buffs[401]+buffs[402]+buffs[403]+buffs[404];
				OP1[81] <=  buffs[405]+buffs[406]+buffs[407]+buffs[408]+buffs[409];
				OP1[82] <=  buffs[410]+buffs[411]+buffs[412]+buffs[413]+buffs[414];
				OP1[83] <=  buffs[415]+buffs[416]+buffs[417]+buffs[418]+buffs[419];
				OP1[84] <=  buffs[420]+buffs[421]+buffs[422]+buffs[423]+buffs[424];							 		
				OP1[85] <=  buffs[425]+buffs[426]+buffs[427]+buffs[428]+buffs[429];	
				OP1[86] <=  buffs[430]+buffs[431]+buffs[432]+buffs[433]+buffs[434];	
				OP1[87] <=  buffs[435]+buffs[436]+buffs[437]+buffs[438]+buffs[439];	
				OP1[88] <=  buffs[440]+buffs[441]+buffs[442]+buffs[443]+buffs[444];	
				OP1[89] <=  buffs[445]+buffs[446]+buffs[447]+buffs[448]+buffs[449];				
				OP1[90] <=  buffs[450]+buffs[451]+buffs[452]+buffs[453]+buffs[454];
				OP1[91] <=  buffs[455]+buffs[456]+buffs[457]+buffs[458]+buffs[459];
				OP1[92] <=  buffs[460]+buffs[461]+buffs[462]+buffs[463]+buffs[464];
				OP1[93] <=  buffs[465]+buffs[466]+buffs[467]+buffs[468]+buffs[469];
				OP1[94] <=  buffs[470]+buffs[471]+buffs[472]+buffs[473]+buffs[474];
				OP1[95] <=  buffs[475]+buffs[476]+buffs[477]+buffs[478]+buffs[479];
				OP1[96] <=  buffs[480]+buffs[481]+buffs[482]+buffs[483]+buffs[484];
				OP1[97] <=  buffs[485]+buffs[486]+buffs[487]+buffs[488]+buffs[489];
				OP1[98] <=  buffs[490]+buffs[491]+buffs[492]+buffs[493]+buffs[494];
				OP1[99] <=  buffs[495]+buffs[496]+buffs[497]+buffs[498]+buffs[499];
			end
	end	
	
	always @(posedge clk) begin
			if (reset) begin
				for(l=0; i<20; l=l+1)
					OP2[l] <= 0;
				end
			end
			
			else begin
				OP2[0] <=  OP1[0]+OP1[1]+OP1[2]+OP1[3]+OP1[4];
				OP2[1] <=  OP1[5]+OP1[6]+OP1[7]+OP1[8]+OP1[9];
				OP2[2] <=  (~(OP1[10]+OP1[11]+OP1[12]+OP1[13]+OP1[14])+32'd1);
				OP2[3] <=  (~(OP1[15]+OP1[16]+OP1[17]+OP1[18]+OP1[19])+32'd1);
				OP2[4] <=  (~(OP1[20]+OP1[21]+OP1[22]+OP1[23]+OP1[24])+32'd1);
				OP2[5] <=  (~(OP1[25]+OP1[26]+OP1[27]+OP1[28]+OP1[29])+32'd1);
				OP2[6] <=  (~(OP1[30]+OP1[31]+OP1[32]+OP1[33]+OP1[34])+32'd1);
				OP2[7] <=  OP1[35]+OP1[36]+OP1[37]+OP1[38]+OP1[39];
				OP2[8] <=  OP1[40]+OP1[41]+OP1[42]+OP1[43]+OP1[44];
				OP2[9] <=  (~(OP1[45]+OP1[46]+OP1[47]+OP1[48]+OP1[49])+32'd1);
				OP2[10] <=  (~(OP1[50]+OP1[51]+OP1[52]+OP1[53]+OP1[54])+32'd1);
				OP2[11] <=  (~(OP1[55]+OP1[56]+OP1[57]+OP1[58]+OP1[59])+32'd1);
				OP2[12] <=  OP1[60]+OP1[61]+OP1[62]+OP1[63]+OP1[64];
				OP2[13] <=  OP1[65]+OP1[66]+OP1[67]+OP1[68]+OP1[69];
				OP2[14] <=  OP1[70]+OP1[71]+OP1[72]+OP1[73]+OP1[74];
				OP2[15] <=  OP1[75]+OP1[76]+OP1[77]+OP1[78]+OP1[79];
				OP2[16] <=  OP1[80]+OP1[81]+OP1[82]+OP1[83]+OP1[84];
				OP2[17] <=  (~(OP1[85]+OP1[86]+OP1[87]+OP1[88]+OP1[89])+32'd1);
				OP2[18] <=  (~(OP1[90]+OP1[91]+OP1[92]+OP1[93]+OP1[94])+32'd1); 
				OP2[19] <=  OP1[95]+OP1[96]+OP1[97]+OP1[98]+OP1[99];
			end
	end
	
	always @(posedge clk)begin
			if (reset) begin
				for(m=0; m<4; m=m+1) begin
					OP3[m] <= 0;
				end
			end
			
			else begin
				OP3[0] <= OP2[0] + OP2[1] + OP2[2] + OP2[3] + OP2[4];
				OP3[1] <= OP2[5] + OP2[6] + OP2[7] + OP2[8] + OP2[9];
				OP3[2] <= OP2[10] + OP2[11] + OP2[12] + OP2[13] + OP2[14];
				OP3[3] <= OP2[15] + OP2[16] + OP2[17] + OP2[18] + OP2[19];
			end
	end
	
	always @(posedge clk) begin
			if (reset) begin
				OP4 = OP3[0] + OP3[1] + OP3[2];
			end
	end
	
	always @(posedge clk) begin
		data_out <= OP4;
	end
	
endmodule	