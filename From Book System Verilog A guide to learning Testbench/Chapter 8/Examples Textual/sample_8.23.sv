// Sample 8.23 Extended transaction class with new copy function


class BadTr extends Transaction;

	virtual function Transaction copy(input Transaction to=null);
	BadTr bad;

	if (to == null)
		bad = new();				// Create a new object
	else
		$cast(bad, to);				// Reuse existing one
	super.copy(bad);				// Copy base data fields
	bad.bad_csm = this.bad_csm;		// Copy extended fields

	return bad;
	endfunction: copy
endclass: BadTr