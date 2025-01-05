/*10. Expand the Transaction class below so back-to-back transactions of the
same type do not have the same address. Test the constraint by generating 20
transactions.*/

package my_package;
	typedef enum {READ, WRITE} rw_e;

	class Transaction;
			// Variables
				rw_e old_rw;				// Stores the previous transaction type
		rand 	rw_e rw;
		rand 	bit [31:0] addr, data;


		bit[1:0] old_addr;

		constraint rw_c { if(old_rw == WRITE) rw != WRITE;};

		constraint addr_c {if(old_rw == rw) old_addr!= addr;}

		function void post_randomize();
			old_rw = rw;
			old_addr= addr;
		endfunction : post_randomize

		function void print_all;
			$display("addr = %d, data = %d, rw = %s", addr, data, rw);
		endfunction : print_all
		
	endclass : Transaction
endpackage : my_package

module question10;
	import my_package::*;
		

	Transaction trns;
		initial
			begin
				// Create a Transaction object
				trns = new();

				// Generate 20 transactions

				repeat(20) begin
					assert(trns.randomize()) else $fatal("Randomization failed!");
				end	
			end

endmodule : question10