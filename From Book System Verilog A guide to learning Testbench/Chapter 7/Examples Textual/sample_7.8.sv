// Sample 7.8 Dynamic thread creation

program automatic test(bus_ifc.TB bus);
	// Code for interface not shown
	task check_trans(input Transaction tr);
		fork
			begin
				wait (bus.cb.data == tr.data);
				$display("@%0t: data match %d", $time, tr.data);
			end
		join_none
		
	endtask : check_trans


		Transaction tr;

	initial
		begin
			repeat (10) begin
				tr = new();				// Create a random transaction
				`SV_RAND_CHECK(tr.randomize());
				transmit(tr);			// Send transaction into the DUT
				check_trans(tr);		// Wait for reply from DUT
			end
			#100;  // Wait for final transaction to complete
		end
endprogram
