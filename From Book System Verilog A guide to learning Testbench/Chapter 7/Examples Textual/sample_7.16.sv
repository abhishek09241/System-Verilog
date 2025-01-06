// Sample 7.16 Disabling a thread

parameter TIME_OUT = 1000ns;

task check_trans(input Transaction tr);
	fork
		
		begin
			// Wait for response, or some maximum delay

			fork: timeout_block
				begin
					wait (bus.cb.data == tr.data);
					$display("@%0t: data match %d", $time, tr.data);
				end
				#TIME_OUT $display("@%0t: Error: timeout", $time);
			join_any
			disable timeout_block;
		end
	join_none			// Spawn thread, don't block
endtask : check_trans