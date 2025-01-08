// Sample 8.4 Driver class

// `include "sample_8.1.sv"

class Driver;

	mailbox #(Transaction) gen2driv;		// Mailbox between generator and driver

	function  new(input mailbox #(Transaction) gen2driv);
		this.gen2driv = gen2driv;
	endfunction : new

	virtual task run();
		
		Transaction tr;			// Handle to a transaction object or
								// a class extended from transaction

		forever	begin
			gen2driv.get(tr);	// Get transaction from generator
			tr.calc_csm();		// Process the transaction
			@ifc.cb;

			ifc.cb.src<=tr.src;		// Send transaction

		end
	endtask : run
	
endclass : Driver