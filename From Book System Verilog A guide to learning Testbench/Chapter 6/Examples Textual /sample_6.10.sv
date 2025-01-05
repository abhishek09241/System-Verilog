// Sample 6.10 Random sets of values

class Ranges;
		rand bit [31:0] c;		// Random variable
			 bit [31:0] lo, hi;	// Non-random varibales used as limits

			 constarint c_range{
			 	c inside {[lo:hi]};			// lo <= c && c<= hi
			 }

			// Sample 6.11 Inverted random set constraint

			 constraint c_range {
				!(c inside {[lo:hi]});			// c<lo or c>hi	
			 }


endclass: Ranges


