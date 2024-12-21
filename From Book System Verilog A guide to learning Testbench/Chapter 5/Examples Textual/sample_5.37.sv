// Sample 5.37 Copying a complex class with new operator

module sample_5_37;
	Transaction src, dst;
	initial
		begin
			src = new();				// Create first object
			src.stats.startT = 42;		// Set start time
			dst	= src.copy();			// Deep copy src to dst
			dst.stats.startT = 96;		// Changes stats for dst only
			$display("src.stats.startT");	// "42"
		end

endmodule : sample_5_37