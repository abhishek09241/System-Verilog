/*1. Given the following class, create a method in an extended class ExtBinary that
multiplies val1 and val2 and returns an integer.*/

// Base class Binary
class Binary;
	// Random 4-bit variables
	rand bit [3:0] val1, val2;

	// Constructor to initialize val1 and val2
	function  new(input bit [3:0] val1, val2);
		this.val1 = val1;
		this.val2 = val2;
	endfunction : new

	// Virtual function to print an integer value
	virtual function void print_int(input val);
		$display("val = 0d%0d", val);
	endfunction : print_int
endclass : Binary

// Extended class ExtBinary inheriting from Binary
class ExtBinary extends  Binary;

		// Constructor calling the base class constructor
		function new(input bit [3:0] val1, val2);
			super.new(val1, val2);
		endfunction

	// Function to multiply val1 and val2 and return an integer result	
	function int multiplies();
		multiplies = val1*val2;
	endfunction : multiplies
	
endclass : ExtBinary