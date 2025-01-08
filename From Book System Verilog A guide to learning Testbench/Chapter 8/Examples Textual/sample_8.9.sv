// Sample 8.9 Injecting an extended transaction into testbench

// `include "sample_8.2.sv"
`include "sample_8.8.sv"
program automatic test;

	Environment env;

	initial
		begin
			env = new();			// Construct generator, etc
			env.build();

			begin
				BadTr bad = new();			// Replace blueprint with
				env.gen.blueprint = bad;	// the "bad" one
			end


			env.run();					// Run the test with BadTr
			env.wrap_up();				// Clean up afterwards
		end
endprogram