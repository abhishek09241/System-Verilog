// Waiting for multiple threads with wait fork

module sample_7_27;

event done[N_GENERATORS];

initial
	begin
		foreach (gen[i]) begin
			gen[i] = new (done[i]);				// Create N generators
			gen[i].run();						// Start them running			
		end


		// Wait for all gen to finish by waiting for each event

		foreach (gen[i]) begin
			fork
				automatic int k = i;
				wait (done[k].triggered);				
			join_none			
		end
		wait fork;					// Wait for all those triggers to finish
	end

endmodule : sample_7_27
