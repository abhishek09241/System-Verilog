// Sample 8.21 Extended transaction class with virtual copy method


class BadTr extends Transaction;
	rand bit bad_csm;

	virtual function Transaction copy();
		
		BadTr bad;
		bad 		= new();				// Construct extended oobject
		bad.src		= this.src;				// Copy data fields
		bad.dst		= this.dst;
		bad.csm 	= this.csm;
		bad.data    = this.data;
		bad.bad_csm = this.bad_csm;

		return bad;						// Return handle to copy

	endfunction : copy

endclass: BadTr