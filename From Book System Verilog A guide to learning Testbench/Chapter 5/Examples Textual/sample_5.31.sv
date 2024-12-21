// Sample 5.31 Copying a simple class with new

class Transaction;
	bit [31:0] addr, csm, data[8];
	function new ();
		$display("In %m");
	endfunction : new
endclass : Transaction

module sample_5_31;
	Transaction arc, dst;
	initial
		begin
			src = new();					// Create first object
			dst - new src;					// Make a copy with new operator
		end

endmodule : sample_5_31
