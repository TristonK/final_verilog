module seg_h(data_d,out_q,en);
	input [3:0]data_d;
	input en;
	output  reg[6:0]out_q;
	
	always @(*)
	begin
		if(en)begin
			case (data_d)
				0:out_q=7'b1000000;
				1:out_q=7'b1111001;
				2:out_q=7'b0100100;
				3:out_q=7'b0110000;
				4:out_q=7'b0011001;
				5:out_q=7'b0010010;
				6:out_q=7'b0000010;
				7:out_q=7'b1111000;
				8:out_q=7'b0000000;
				9:out_q=7'b0010000;
			
			
				10:out_q=7'b0001000;
				11:out_q=7'b0000011;
				12:out_q=7'b1000110;
				13:out_q=7'b0100001;
				14:out_q=7'b0000110;
				15:out_q=7'b0001110;
			endcase
		end
		else out_q=7'b1111111;
	end
endmodule 