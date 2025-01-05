/*9. Create a class, StimData, containing an array of integer samples. Randomize
the size and contents of the array, constraining the size to be between 1 and
1000. Test the constraint by generating 20 transactions and reporting the size.*/

class StimData;
	rand int samples[];

	constraint c_samples {
		samples.size() inside {[1:1000]};
	}
	
endclass : StimData

module question9;
	StimData stim_data;

	initial
		begin
			repeat(20) begin
				stim_data = new();
				assert(stim_data.randomize()) else $fatal("Randomization failed!");
				$display("Transaction: Array size = %0d", stim_data.samples.size());	
			end
			
		end

endmodule : question9

