// Sample 8.5 Bad Generator class

// Generator class that uses Transaction objects
// First attempt .... to0 limited



`include "sample_8.1.sv"
class Generator;
	mailbox #(Transaction) gen2driv;			// Carries transactions to driver
	Transaction tr;



	function new(input mailbox #(Transaction) gen2driv);
		this.gen2driv = gen2driv;							// this-> class-level var
	endfunction : new


	virtual task run(input int num_tr =10);
		repeat (num_tr) begin
			tr = new();					// Construct transaction
			`SV_RAND_CHECK(tr.randomize());		// Randomize it
			gen2driv.put(tr.copy());			// Send copy to driver
		end
	endtask : run
endclass : Generator