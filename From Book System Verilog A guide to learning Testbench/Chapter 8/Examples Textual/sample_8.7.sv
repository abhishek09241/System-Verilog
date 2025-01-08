// Sample 8.7 Environment class

// Testbench environment class


`include "sample_8.1.sv"
`include "sample_8.6.sv"
`include "sample_8.4.sv"



class Environment;
	Generator gen;
	Driver drv;

	mailbox #(Transaction) gen2driv;


	virtual function void build();			// Build the environment by
		gen2driv = new();					// Constructing the  mailbox,
		gen 	 = new(gen2driv);			// the generator,
		drv 	 = new(gen2driv);			// and driver
	endfunction : build

	virtual task run();
		fork
			gen.run();
			drv.run();
		join
	endtask : run


	virtual task wrap_up();
		// Empty for now-call scoreboard for report
	endtask : wrap_up
endclass: Environment