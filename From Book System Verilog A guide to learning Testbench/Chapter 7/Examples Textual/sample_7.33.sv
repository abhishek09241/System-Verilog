// Sample 7.33 Good generator creates many objects

task generator_good(input int n,
					input mailbox #(Transaction) mbx);
		
		Transaction tr;
		repeat(n) begin
			tr = new();				// Create a new transaction
			`SV_RAND_CHECK(tr.randomize());
			$display("GEN: Sending addr = %h", tr.addr);
			mbx.put(tr);				// Send transaction to driver
		end
endtask : generator_good