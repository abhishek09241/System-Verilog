// Sample 5.32 Copying a complex class with new operator

class Transaction;
		bit [31:0] addr, csm data[8];
		static int count = 0;
		int id;

		Statistics stats;						// Handle points to statistics object

		function new ();
			stats = new();						// Construct a new Statistics object
			id = count++;		
		endfunction : new	
endclass : Transaction


module sample_5_32;
	Transaction src, dst;
		initial
			begin
				src = new();							// Create a Transaction object
				src.stats.startT  = 42;					
				dst	= new src;							// Copy src to dst with new operator

				dst.stats.startT = 96;					// Changes stats for dst & src
				$display("src.stats.startT",);			// 96
			end

endmodule : sample_5_32