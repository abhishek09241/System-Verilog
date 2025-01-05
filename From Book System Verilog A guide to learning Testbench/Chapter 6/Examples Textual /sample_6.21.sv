// Sample 6.21 Bidirectional constraints

class Bidir;
	rand bit [15:0] r, s,t;

	constraint c_bidir {
		r < t;						// All are solved in parallel
		s == r;						// A value for r affects s, t
		t < 10;
		s > 5;
	}
endclass : Bidir