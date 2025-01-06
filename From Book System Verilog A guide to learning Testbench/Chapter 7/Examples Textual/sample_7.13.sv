// Sample 7.13 Automatic variables in a fork......join_none

program automatic bug_free;
	initial
		begin
			for (int j = 0; j < 3; j++) begin
				automatic int k = j;				//Make copy of index

				fork
					begin
						$write();					// Print copy
					end
				join_none
			end
			# $display;					// New line after all threads end
		end
endprogram