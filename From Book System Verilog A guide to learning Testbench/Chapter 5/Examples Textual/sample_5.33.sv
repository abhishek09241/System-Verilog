// Sample 5.33 Simple class with copy function

class Transaction;
	bit [31:0] addr, csm, data[8];			// No Statistic handle

	function Transaction copy();
		copy 		= new();					// Construct declaration
		copy.addr	= addr;						// Fill in data values
		copy.csm	= csm;
		copy.data 	= data;						// Array copy	
	endfunction : copy
endclass : Transaction