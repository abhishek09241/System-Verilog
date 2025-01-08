// Sample 8.3 Constructor with arguments in an extended class


class Base;
	int val;
	
	function new(input int val);			// Has an argument
		this.val = val;
	endfunction: new
endclass : Base


class Extended extends Base;

	function  new(input int val);
		super.new(val);					// Must be first line of new
		// Other constructors actions
	endfunction : new
endclass : Extended