module ramdomnum(
         input clk,
	     output reg [7:0] q
			);

always @(posedge clk)
begin //using 1+x^2+x^3+x^4+x^8
	  if(q==8'd0)
	   begin
	    q<=8'd12;
	   end
	  else
	   begin
	     q[0]<=q[7];
	     q[1]<=q[0];
	     q[2]<=q[1]^q[7];
	     q[3]<=q[2]^q[7];
	     q[4]<=q[3]^q[7];
	     q[5]<=q[4];
	     q[6]<=q[5];
	     q[7]<=q[6];
	  end
end




endmodule 