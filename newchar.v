module newchar(
    input clk,
	 output reg clk_ls
);

reg [26:0] countclk;

initial
begin
   countclk=0;
	clk_ls=0;
end

always @(posedge clk)
 if(countclk==50000000)  
 begin
   countclk <=0;
   clk_ls <= ~clk_ls;
  end
 else
   countclk <= countclk+1;
	
endmodule 