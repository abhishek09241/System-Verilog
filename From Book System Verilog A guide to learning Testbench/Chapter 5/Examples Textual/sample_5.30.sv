// Sample 5.30 Using an array of handles

task generator();
		Transaction tarray[10];
		foreach (tarray[i])
			begin
				tarray[i] = new();				// Construct each object
				transmit(tarray[i]);
			end
endtask: generator