// Sample 7.26 Passing an event into a constructor

program autommatic test;

		class Generator;
			event done;
			function new(input event done);			// Pass event from TB
				this.done = done;
			endfunction : new

			task run();
				fork
					begin
						// Create transactions
						-> done;			// Tell the test we are done
					end
				join_none
			endtask : run
		endclass : Generator

		event gen_done;
		Generator gen;

		initial
			begin
				gen = new(gen_done);				// Instantiate testbench
				gen.run();							// Run transactor
				wait(gen_done.triggered);			// Wait for finish
			end
endprogram 