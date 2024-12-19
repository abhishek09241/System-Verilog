/*2. For the following interface, add the following code.
a. A clocking block that is sensitive to the negative edge of the clock, and all I/O
that are synchronous to the clock.
b. A modport for the testbench called master, and a modport for the DUT called
slave
c. Use the clocking block in the I/O list for the master modport.*/

interface my_if (input bit clk);



	// Signal Declaration

	bit    	     write;				// Signal to indicate a write  operation
	bit   [15:0] data_in;			// Data input to be written to the DUT
	bit   [7:0]  address;			// Address signal for the DUT
	logic [15:0] data_out;			// Data output from the DUT



	// Clocking Block: Synchronizes signals to the negative edge of the clock

	clocking cb @(negedge clk);
		input write, data_in, address;			// Inputs driven by the testbench (master)
		output data_out;						// Outputs driven by the DUT (slave)
	endclocking


	// Modport for the testbench (master)
	// Testbenhc uses the clocking block to drive inputs and read outputs
	modport MASTER (clocking cb);


	// Modport for the DUT (slave)
	// DUT reads inputs directly and drives the output
	modport SLAVE (output write, data_in, address,					// Signal driven by the testbench
				   input data_out);									// Signal driven by the DUT
	
endinterface : my_if