// Sample 7.29 Waiting for multiple threads using a thread count

class Generator;

	static int thread_count = 0;

	task run();
		thread_count++;				// Start another thread
		fork
			begin
				// Do the real work in here
				// And when done, decrement the thread count
				thread_count--;
			end
		join_none
	endtask : run
	
endclass : Generator

module sample_7_29;

	Generator gen[N_GENERATORS];

	initial
		begin
			// Create N generators
			foreach (gen[i]) begin
				gen[i] = new();


			// Start them running
			foreach (gen[i]) begin
				gen[i].run();

				// Wait for all the generators to compelete
				wait(Generator::thread_count == 0);
				
			end
				
			end
		end

endmodule : sample_7_29