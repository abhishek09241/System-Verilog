// Sample 5.5 Simple user defined new() function

class Transaction;
	logic [31:0] addr, csm, data[8];


	function new();
		addr = 3;
		data = '{default:5};
	endfunction :new
	
endclass : Transaction
