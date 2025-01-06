// Sample 7.22 Waiting for an event

event e1, e2;

initial 
	begin
		$display("@%0t: 1: before triggrt", $time);
		-> e1;
		wait (e2.triggered);
		$display("@%0t: 1: after trigger", $time);
	end

initial
	begin
		$display("@%0t: 2: before trigger", $time);
		-> e2;
		wait(e1.triggered)
		$display("@%0t: 2: after trigger", $time);
	end



/* Sample 7.23 Output from waiting for an event

@0: 1: before trigger
@0: 2: before trigger
@0: 1: after trigger
@0: 2: after trigger 

*/


