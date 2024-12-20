// Sample 5.23 Encapsulating the Statistics class

class Transaction;
	bit [31:0] addr, csm, data[8];
	Statistics stats;					// Statistics handle


	function new ();
		stats = new();				// Make instance of Statistics
	endfunction : new


	task transmit_me();
		// Fill packet with data
		stats.start();
		// Transmit packet
		#100;
		stats.stop();
	endtask : transmit_me
endclass : Transaction