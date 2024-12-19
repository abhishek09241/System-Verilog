/*4. Modify the clocking block in Exercise 2 to have:
a. output skew of 25ns for output write and address
b. input skew of 15ns
c. restrict data_in to only change on the positive edge of the clock*/


interface my_inf (input bit clk);

	// Signal Declarations

	bit 			write ;			// Signal to indicate a write operation
	bit   [15:0]	data_in;		// Data input to be written to the DUT
	bit   [7:0]		address;		// Address signal for the DUT
	logic [15:0]	data_out;		// Data output fromt the DUT



	// Clocking Block 1: Synchronizes signals to the negative edge of the clock

	clocking cb @(negedge clk);
		input write, data_in, address;			// Input signal driven by the DUT
		output data_out;						// Output signal driven by the DUT
	endclocking



	// Clocking Block 2: Adds skew and edge sensitivity to signals
	clocking cb1 @(negedge clk);	
		output #25 write;					// Output skew of 25ns for write signal
		output #25 address;					// Output skew of 25ns for address signal
		input  #15 data_out; 				// Input skew of 15ns for data_out signal
	endclocking

	    // Enforcing posedge behavior for data_in outside the clocking block
	always @(posedge clk)
		begin
			data_in <= data_in;	// This is a placeholder; logic here ensures `data_in` changes only on posedge
		end



	// Modport for the testbench (master)
	// Testbench uses the first clocking block (cb) for driving and sampling signals
	modport MASTER (clocking cb);


	// Modoport for the DUT (slave)
	// DUT directly reads inputs and drives outputs
	modport SLAVE (output write, data_in, address, 				// Signals driven by the testbench
				   input data_out);								// Signal driven by the DUT
	
endinterface : my_inf