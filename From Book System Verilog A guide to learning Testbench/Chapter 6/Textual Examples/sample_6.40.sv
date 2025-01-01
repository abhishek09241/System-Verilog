// Sample 6.40 Randomizing a subset of variables in a class

class Rising;
				bit [7:0] low;					// Not random
		rand	bit [7:0] med, hi;				// Random varibale
		constraint up {
			{low<med; med<hi;}	
		}
endclass : Rising

module sample_6_40;

	Rising r;

	initial
		begin
			r = new();
			r.randomize();					// Randomize med, hi; low untouched
			r,randomize(med);				// Randomize only med
			r.randomize(low)				// Randomize only low, even though not rand
		end

endmodule : sample_6_40



/*This trick of only randomizing a subset of the variables is not commonly used in
real testbenches as you are restricting the randomness of your stimulus. You want
your testbench to explore the full range of legal values, not just a few corners.*/