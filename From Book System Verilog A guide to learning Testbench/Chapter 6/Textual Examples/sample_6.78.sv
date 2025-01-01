// Sample 6.78 Simple test using random configuration

program automatic test;
	Environment env;

	initial
		begin
			env = new();			// COnstruct environment
			env.gen_cfg();			// Create random configuration
			env.build();			// Build the tesbench environemnt
			env.run();				// Run the test
			env.wrap_up();			// Clean up after test & report
		end
endprogram