/*11. Expand the RandTransaction class below so back-to-back transactions of
the same type do not have the same address. Test the constraint by generating
20 transactions.*/

class Transaction;
	rand rw_e rw;
	rand bit [31:0] addr, data;
endclass : Transaction


class RandTransaction;

	// Define a dynamic array of transaction objects
	rand Transaction trans_array[];

// Constraint to prevent back to back write
	constraint rw_c { foreach (trans_array[i])
		if((i>0) && (trans_array[i-1].rw == WRITE))
		trans_array[i].rw != WRITE;}

/*Add to class RandTransaction the following code. Note that a constraint for rw=WRITE is not
required because back to back writes are already not allowed.*/

	constraint addr_c { foreach (trans_array[i])
		if((i>0) && (trans_array[i-1].rw == READ)
		trans_array[i-1].addr != trans_array[i].addr;}
	
// Constructor to initialize the dynamic array
	function new ();
		trans_array = new[20];			// Set the array size to 20 transactions
		foreach (trans_array[i]) begin
			trans_array[i] = new();
		end
	endfunction : new
endclass : RandTransaction

module question11;
	//Transaction trns;
	RandTransaction rnd_trns;

	initial
		begin
			//trns = new();
			rnd_trns = new();

			
				assert(rnd_trns.randomize()) else $fatal("Randomization failed!");

				// Print the transactions to verify constraints

				foreach (rnd_trns.trans_array[i]) begin
					$display("Transaction %0d: rw =%s, addr = %0d, data = %0d",
							  i, rnd_trns.trans_array[i].rw_name(),
							  rnd_trns.trans_array[i].addr,
							  rnd_trns.trans_array[i].data);
				end

			end
		end

endmodule : question11