// Sample 8.22 Base Transaction class with copy function


class Transaction;

	virtual function Transaction copy(input Transaction to=null);
		if(to == null)
			copy = new();			// Construct new object
		else
			copy  = to;				// or use existing
		copy.src  = this.src;		// Copy data fields
		copy.dst  = this.dst;		
		copy.data = this.data;
		copy.csm  = this.csm;
		return copy;
	endfunction : copy

endclass : Transaction