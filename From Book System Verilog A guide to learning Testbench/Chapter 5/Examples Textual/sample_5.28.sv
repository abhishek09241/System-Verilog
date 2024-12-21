// Sample 5.28 Bad generator creates only one object

task generator_bad(input int n);
	Transaction t;
	t=new();										// Create one new object
	repeat (n) 
		begin
			t.addr = $random();						// Initialize variables
			$display("Sending addr=%h",t,addr);
			transmit(t);							// Send it into the DUT	
		end
endtask : generator_bad