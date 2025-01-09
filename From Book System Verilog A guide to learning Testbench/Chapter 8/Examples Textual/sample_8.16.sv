// Sample 8.16 Calling class methods

Transaction tr;
BadTr bad;


initial
	begin
		tr = new();				
		tr.calc_csm();				// Calls Transaction:: calc_csm


		bad = new();
		bad.calc_csm();				// Calls BadTr::calc_csm



		tr = bad;					// Base handle points to ext obj
		tr.calc_csm();				// Calls BadTr:: calc_csm
	end