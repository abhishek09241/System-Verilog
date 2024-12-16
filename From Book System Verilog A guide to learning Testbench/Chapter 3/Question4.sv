/*Create the SystemVerilog code to specify that the time should be printed in ps
(picoseconds), display 2 digits to the right of the decimal point, and use as few
characters as possible*/


module Question4 ();

	timeunit 1ns;
	timeprecision 1ps;
	parameter real t_real = 5.5;
	parameter time t_time = 5ns;

	initial
		begin
			#t_time $display("1 %t", $realtime());
			#t_real $display("1 %t", $realtime());
			#t_time $display("1 %t", $realtime());
			#t_real $display("1 %t", $realtime());
		end

	initial
		begin
			#t_time $display("2 %t", $realtime());
			#t_real $display("2 %t", $realtime());
			#t_time $display("2 %t", $realtime());
			#t_time $display("2 %t", $realtime());
		end
	


	initial
		begin
			// Print simulation time in picoseconds with a 2 decimal places
			$display("Time:  %.2f ps",$time/1.0);
		end


endmodule : Question4