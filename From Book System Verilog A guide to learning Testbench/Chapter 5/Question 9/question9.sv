/* For the following class, create a copy function and demonstrate its use.
Assume the Statistics class has its own copy function. */

package automatic my_package;
	class MemTrans;
		bit [7:0] data_in;
		bit [3:0] address;
		Statistics stats;

		function new ();
			data_in = 3;
			address = 5;
			stats   = new();
		endfunction : new
		
		// Add member function copy to class MemTrans declaration

		function MemTrans copy();
			copy = new();
			copy.address = address;
			copy.data_in = data_in;
			copy.stats   = stats;
		endfunction : copy
	endclass : MemTrans
endpackage : my_package

module question9;

	initial
		begin
			MemTrans my_memstrans1;
			MemTrans my_memstrans3;				// Declare new handle to point to copied object
			my_memstrans3 = my_memstrans1.copy()
		end

endmodule : question9