module ramdomx(
         input clk,
	      output reg [8:0] q
			);

reg feedback;			
			
always @(posedge clk)
begin 
	  if(q==9'd0)
	   begin
	    q<=9'd123;
	   end
	  else
	   begin
		   feedback = q[8]^(~|q[7:0]);
	     q[7] = q[6];
		  q[6]=q[5];
		  q[5]=q[4];
		  q[4]=q[3]^feedback;
		  q[3]=q[2];
		  q[2]=q[1];
		  q[1]=q[0];
		  q[0] = feedback;
	  end
	  
end




endmodule 