/*7. For the following class, create:
a. A constraint that limits read transaction addresses to the range 0 to 7,
inclusive.
b. Write behavioral code to turn off the above constraint. Construct and ran-
domize a MemTrans object with an in-line constraint that limits read trans-
action addresses to the range 0 to 8, inclusive. Test that the in-line constraint
is working.*/


class MemTrans;
	rand bit 	   rw;				// read if rw=0, write if rw=1
	rand bit [7:0] data_in;			// Data input
	rand bit [3:0] address;			// 4-bit address



	//Construct to limit read transaction addresses to the range 0 to 7

	constraint read_address_range {
		(rw == 0) -> (address inside {[0:7]});
	}

endclass : MemTrans


module question7;

		MemTrans mem_trans;

		initial
			begin
				// Step 1: Construct the MemTrans object
				mem_trans = new();



				// Step 2: Randomize with the default constraint
				$display("Randomizing with default constraint (address range: 0 to 7):");
				for (int i = 0; i < 5; i++) begin
					assert(mem_trans.randomize()) else $fatal("Randomization failed!");
					$display("rw: %0d, address: %0d", mem_trans.rw, mew_trans.address);
				end
			


			// Step 3: Turn off the default constraint

			mem_trans.constraint_mode("read_address_range",0);


			// Step 4: Randomize with an-line constraint for address range 0 to 8
			$display("\nRandomizing with in-line constraint (address range: 0 to 8):");
			for (int i = 0; i < 5; i++) begin
				assert(mem_trans.randomize()with{
					(rw==0)->(address inside {[0:8]});
					}) else $fatal ("Randomization with in-line constraint failed!");
				$display("rw: %0d, address: %0d", mem_trans.rw, mew_trans.address);
				end
			end
endmodule : question7