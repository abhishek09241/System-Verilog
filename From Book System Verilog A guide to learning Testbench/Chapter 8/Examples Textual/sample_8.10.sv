// Sample 8.10 Adding a constraint with inheritance

class Nearby extends Transaction;

constraint c_nearby {
	dst inside {[src-100:src+100]};
}

// Copy method not shown
endclass : Nearby

program automatic test;
	Environment env;

	initial
		begin
			env = new();	
			env.build();			// Construct generator, etc;

			begin
				Nearby nb = new();		// Create a new blueprint
				env.gen.blueprint = nb;		// Replace the blueprint
			end

			env.run();						// Run the test with Nearby
			env.wrap_up();					// Clean up afterwards
		end
endprogram