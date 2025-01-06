// Sample 7.31 Mailbox declarations

mailbox #(Transaction) mbx_tr;			// Parameterized: recommended
mailbpx mbx_untyped;					// Unspecialized: avoid




// Sample 7.32 Bad generator creates only one object

task generator_bad(input int n,
				   input mailbox #(Transaction) mbx);

	Transaction tr;

	tr = new();				// Create just one transaction
	
	repeat (n) begin
		`SV_RAND_CHECK(tr.randomize());
		$display("GEN: Sending addr=%h", tr.addr);
		mbx.put(tr);				// Send transaction to driver
	end
endtask : generator_bad