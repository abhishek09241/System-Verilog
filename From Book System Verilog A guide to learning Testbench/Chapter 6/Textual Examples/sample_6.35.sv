// Sample 6.35 Building a bathtub distribution

class Bathtub;
	int value;				// Random variable with bathtub dist
	int WIDTH = 50, DEPTH=6, seed=1;


	function void pre_randomize();
		
		// Calculate an exponental curve
		value = $dist_exponential(seed,DEPTH);
		if(value > WIDTH) value = WIDTH;

		// Randomly put this point on the left or right curve

		if($urandom_range(1))					// Random 0 or 1
			value = WIDTH - value;
	endfunction : pre_randomize
endclass : Bathtub