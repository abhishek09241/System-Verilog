// Waiting for an edge on an event

forever begin
	// This prevents a zero delay loop!
	@handshake;
	$display("Received next event");
	process_in_zero_time();
end