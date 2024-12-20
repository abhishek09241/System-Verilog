// Sample 5.21 Using this to refer to class variable

class Scoping;
	string name;

	function new (input string  name);
		this.name = name;		// class name = local name
	endfunction : new
endclass : Scoping