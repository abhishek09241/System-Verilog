// Sample 8.2 Extended Transaction class

// `include "sample_8.1.sv"

class BadTr extends  Transaction;
		
		rand bit bad_csm;

		virtual function void calc_csm();
			super.calc_csm();			// Compute good csm
			if(bad_csm) csm = ~csm;		// Corrupt the csm bits
		endfunction : calc_csm


		virtual function void display(input string prefix="");
			$write("%sBadTr: bad_csm=%b,", prefix, bad_csm);
			super.display();			
		endfunction : display

endclass : BadTr