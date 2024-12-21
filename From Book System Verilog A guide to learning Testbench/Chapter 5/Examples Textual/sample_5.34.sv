// Sample 5.34 Using a copy function
module sample_5_34;
	Transaction src, dst;

		initial
			begin
				src = new();					// Create first object
				dst = src.copy();				// Make a copy of the object				
			end

endmodule : sample_5_34

