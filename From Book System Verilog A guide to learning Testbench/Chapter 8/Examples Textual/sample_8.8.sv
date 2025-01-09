// Simple test program using environment defaults

`include "sample_8.7.sv"
program automatic test;

	Environment env;

	initial
		begin
			env = new();			// Construct the environment
			env.build();			// Build testbench objects
			env.run();				// Run the test
			env.wrap_up();			// Clean up afterwards
		end

endprogram