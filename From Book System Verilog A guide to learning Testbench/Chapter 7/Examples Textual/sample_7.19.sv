// Sample 7.19 Using disbale label to stop a task

task wait_for_time_out(input int id);
	if (id == 0) begin
		fork
			begin
				#2ns;
				$display("@%0t: disable wait_for_time_out", $time);
				disable wait_for_time_out;
			end
		join_none

		fork: just_a_little
			begin
				$display("@%0t: %m: %0d entering thread", $time, id);
				#TIME_OUT;
				$display("@%0t: %m: %d done", $time, id);
			end
		join_none
	end
	
endtask : wait_for_time_out