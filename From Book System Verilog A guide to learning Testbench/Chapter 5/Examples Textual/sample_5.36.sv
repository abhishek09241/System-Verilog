// Sample 5.36 Statistics class declaration

class Statistics;
	time startT;							// Transaction times
	static int ntrans = 0;					// transaction count
	static time total_elapsed_time = 0;

	function Statistics copy();
		copy = new();
		copy.startT = startT;
		
	endfunction : copy
	
endclass : Statistics