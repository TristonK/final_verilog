module ramdomv(
         input clk,
	      output reg [3:0] q
			);

reg feedback;			
			
always @(posedge clk)
begin 
	  if(q==4'd0)
	   begin
	    q<=4'd3;
	   end
	  else
	   begin
		   feedback = q[3]^(~|q[2:0]);
	     q[3]=q[2]^feedback;
		  q[2]=q[1];
		  q[1]=q[0]^feedback;
		  q[0] = feedback;
	  end
end




endmodule 