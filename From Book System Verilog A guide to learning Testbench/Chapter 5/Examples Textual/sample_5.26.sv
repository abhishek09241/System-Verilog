// Sample 5.26 Bad transaction creator task, missing ref on handle

function void create(Transaction tr);			// Bug, missing ref
	tr = new();
	tr.addr=42;

	// Initialize other fields

	
endfunction : create

module sample_5_26;
	Transaction t;

		initial
			begin
				create(t);				// Create a transaction
				$display("t.addr");		// Fails beecause t=null
			end
endmodule : sample_5_26