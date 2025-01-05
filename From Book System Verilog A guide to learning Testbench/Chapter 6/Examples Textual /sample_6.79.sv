// Sample 6.79 Simple test that overrides random configuration

program automatic test;
	Environment env;

	initial 
		begin
			env = new();		// Construct environment
			env.gen_cfg();		// Create random configuration


			// Override random in_use - turn all 4 ports on

			env.cfg.in_use = '1;

			env.build();			// Build the testbench environment
			env.run();				// Run the test
			env.wrap_up();			// Clean up after test & report
		end
endprogram