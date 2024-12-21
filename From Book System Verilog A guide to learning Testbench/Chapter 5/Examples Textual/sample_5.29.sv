// Sample 5.29 Good generator creates many objects

task generator_good(input int n);
	Transaction t;
		repeat (n)
			begin
				t = new();									// Create one new object
				t.addr = $randome();						// Initialize variables
				$display("Sending addr = %h",t.addr);
				transmit(t);								// Send it into the DUT
			end
	
endtask : generator_good