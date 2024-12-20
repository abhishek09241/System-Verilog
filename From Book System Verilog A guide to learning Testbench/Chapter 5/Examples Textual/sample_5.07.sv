// Calling the right new() function

class Transaction;
	logic [31:0] addr, csm, data[8];
endclass : Transaction


class Driver ;
	Transaction tr;
	function new();			// Driver's new function
		tr = new();			// Call the transaction new function
	endfunction
endclass : Driver