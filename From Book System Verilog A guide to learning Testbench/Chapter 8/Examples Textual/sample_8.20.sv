// Sample 8.20 Base transaction class with a virtual copy function


class Transaction;


	rand bit [31:0] src, dst, data[8];			//Variable
		 bit [31:0] csm;


	virtual function Transaction copy();
		copy 	  = new();					// Construct destination object
		copy.src  = this.src;				// Copy data fields
		copy.dst  = this.dst;				// The prefix "this." is
		copy.data = this.data;				// not needed, but makes code
		copy.csm  = this.csm;				// more explicit
		return copy;						// Return handle to copy
	endfunction : copy
endclass: Transaction