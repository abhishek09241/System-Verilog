// Sample 8.15 Transaction and BadTr classes


class Transaction;

	rand bit [31:0] src, dst, data[8];		// Variables
		 bit [31:0] csm;


	virtual function void calc_csm();					// XOR all fields
		csm = src^dst^data.xor;
	endfunction : calc_csm

endclass: Transaction


class BadTr extends  Transaction;
	rand bit bad_csm;
	virtual function void calc_csm();
		super.calc_csm();							// Compute good csm
		if(bad_csm) csm = ~csm;						// Corrupt the csm bits
	endfunction : calc_csm				
endclass : BadTr