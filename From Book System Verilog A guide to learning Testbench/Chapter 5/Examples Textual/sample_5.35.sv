// Sample 5.35 Complex class with deep copy function

class Transaction;
	bit [31:0] addr, csm, data[8];
	Statistics stats;								// Handle points to Statistics object
	static int count = 0;
	int id;

	function new();
		stats = new();
		id 	  = count++;
	endfunction : new


	function Transaction copy();
		copy = new();				// Construct destination object
		copy.addr = addr;			// Fill in data values
		copy.csm  = csm;
		copy.data = data;
		copy.stats = stats.copy();	// Call Statistics :: copy
	endfunction : copy
	
endclass : Transaction