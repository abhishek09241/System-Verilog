/*3. Starting with the solution to Exercise 1, create an extended class Exercise3
that constrains val1 and val2 to be less than 10.*/

class Binary extends;

	// 4-bit random  variables val1 and val2
	rand bit [3:0] val1, val2;

	// Constructor to initialize val1 and val2
	function new(input bit [3:0] val1, val2);
		this.val1 = val1;
		this.val2 = val2;
	endfunction : new

	// Virtual function to print an integer value
	virtual function void print_int(input int val);
		$display("val=0d%0d",val);
	endfunction : print_int
	
endclass : Binary

// Extended class Exercise3 inheriting from Binary
class Exercise3 extends  Binary;

	// Constructor calling the base class constructor
	function new(input bit [3:0] val1, val2);
		super.new(val1,val2);
	endfunction : new

	// Function to multiply val1 and val2 and return an integer result
	function int multiplies();
		multiplies = val1*val2;
	endfunction : multiplies

	// Constraint to ensure val1 and val2 are always less than 10
	constraint exercise_c {
		val1 < 10;
		val2 < 10;
	}
	
endclass : Exercise3