// Sample 7.18 Using disable label to stop threads

initial
	begin
		check_trans(tr0);				// thread 0
		fork 							// thread 1
			begin: threads_inner

				check_trans(tr1);		// thread 2
				check_trans(tr2);		// thread 3
				
			end

			// Stop threads 2 and 3, but leave 0 alone

			#(TIME_OUT/10) disable threads_inner;
		join
	end