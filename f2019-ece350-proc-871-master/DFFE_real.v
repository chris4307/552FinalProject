module DFFE_real(d, clk, clrn, in_enable, q);
	
	 //Inputs
   input d, clk, in_enable, clrn;
   
   //Internal wire
   assign clr = ~clrn;

   //Output
   output q;
   
   //Register
   reg q;

   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr) begin
           q <= 1'b0;
       //If enable is high, set q to the value of d
       end else if (in_enable) begin
           q <= d;
       end
   end


	/*
   input d, clk, in_enable, prn, clrn;
   assign clr = ~clrn;
   //Internal wire
   //wire clr;

   //Output
   output q;
   
   //Register
   reg q;

   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr) begin
           q <= 1'b0;
       //If enable is high, set q to the value of d
       end else if (in_enable) begin
           q <= d;
       end
   end
   */

   /*
	
	input d, clrn, clk, prn, in_enable;
	output q;
	reg q;
	
	always @(posedge clk or negedge clrn or negedge prn) 
	begin

	
	//begin
	//	casex({clk, clrn, prn, in_enable})
	//		4'b100x: q=1'bx;
	//		4'b101x: q=1'b0;
	//		4'b110x: q=1'b1;
	//		4'b1111: q=d;
	//		//default: q=1'b0;
	//	endcase
	
	//end
	

  	  if(~prn) 
	  	  begin
	  	  	if(~clrn) // if preset + clear at the same time, null
		  		q = 1'bx;
		  	else // only preset = good - set that value to 1!
		  		q = 1'b1;
		  end
  	  else if(~clrn) // ok, now it's clear, no preset.
	    q = 1'b0;
	  else if(in_enable)
	    q = d;

	end
	*/
	

endmodule
