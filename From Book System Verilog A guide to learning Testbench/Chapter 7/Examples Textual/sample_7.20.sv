// Sample 7.20 Blocking on an event in Verilog

event e1, e2;

initial
	begin
		$display("@%0t: 1: before trigger", $time);
		-> e1;
		@e2;
		$display("@%0t: 1: after trigger", $time);
	end

initial
	begin
		$display("@%0t: 2: before trigger", $time);
		-> e2;
		@e1;
		$display("@%0t: 2: after trigger", $time);
	end



// Sample 7.21 Output from blocking on an event

// @0: 1: before trigger
// @0: 2: before trigger
// @0: 1: after  trigger