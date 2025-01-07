// Sample 7.17 Limiting the scope of a disable fork

initial
	begin
		check_trans(tr0);		//thread 0

		// Create a thread to limit scope of disable

		fork 					// thread 1
			begin
				check_trans(tr1);	// thread 2
				fork 				// thread 3
					check_trans(tr2);	// thread 4
				join

				// Stop threads 2-4, but leave 0 alone
				#(TIME_OUT/10) disable fork;
			end
		join
	end