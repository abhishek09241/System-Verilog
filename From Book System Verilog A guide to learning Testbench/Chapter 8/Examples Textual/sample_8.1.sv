// Sample 8.1 Base Transaction class

class Transaction;

	rand bit [31:0] src, dst, data[8];				// Random Variables
		 bit [31:0] csm;							// Calculated variable


	virtual	function void calc_csm();
		csm = dst^src^data.xor;
	endfunction : calc_csm
	

	virtual function void display(input string prefix="");
		$display("%sTr:  src=%h, dst=%h, csm=%h, data=%p",prefix,src,dst,csm,data);
		
	endfunction : display
endclass : Transaction