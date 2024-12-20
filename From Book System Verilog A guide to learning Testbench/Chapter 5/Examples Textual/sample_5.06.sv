// Sample 5.6 A new() function with arguments

class Transaction;
	logic [31:0] addr, csm, data[8];

	function new(input logic [31:0] a=3,d=5);
		addr = a;
		data = '{default:d}
	endfunction : new 


	initial
		begin
			Transaction tr;
			tr = new(.a(10));			// a= 10 , d uses default of 5
		end
	
endclass : Transaction