// Sample 7.11 Automatic variables in a fork.....join_none

initial
	begin
		for (int j = 0; j < 3; j++) begin
			fork
				automatic int k = j;		// Make copy of index
				begin
					$write(k);				// Print copy
				end
			join_none
		end
		#0 $display;
	end