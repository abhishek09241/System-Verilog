// Sample 5.25 Passing Objects

// Transmit a packet onto a 32-bit bus
task transmit(input Transaction tr);
	tr.data[0] = ~tr.data[0];		// Corrupt the first word
	CBbux.rx_data <= tr.data[0];

	//....
endtask : transmit

module sample_5_25;
	Transaction tr;

		initial
			begin
				tr = new();				// Allocate the object
				tr.addr = 42;			// Initialize values
				transmit (42);			// Pass Object to task
			end

endmodule : sample_5_25