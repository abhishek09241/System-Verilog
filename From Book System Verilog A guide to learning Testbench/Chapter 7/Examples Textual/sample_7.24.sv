// Sample 7.24 Waiting on event causes a zero delay loop

forever begin
	// This is a zero delay loop!

	wait(handshake.triggered);
	$display("Received next event");
	process_in_zero_time();
end