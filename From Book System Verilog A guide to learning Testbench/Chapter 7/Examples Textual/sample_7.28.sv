// Sample 7.28 Waiting for multiple threads by counting triggers

module sample_7_28;

	event done[N_GENERATORS];
	int done_count;

	initial
		begin
			foreach (gen[i]) begin
				gen[i] = new(done[i]);			// Create N generators
				gen[i].run();					// Start them running
			end

			// Wait for all generators to finish

			foreach (gen[i]) begin
				fork
					automatic int k = i;
					begin
						wait (done[k].triggered);
						done_count++;
					end
				join_none
				wait(done_count==N_GENERATORS);			// Wait for triggers
			end
		end

endmodule : sample_7_28