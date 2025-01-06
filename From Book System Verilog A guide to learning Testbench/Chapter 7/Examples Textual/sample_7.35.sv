// Sample 7.35 Exchanging objects using a mailbox: The Generator class

program automatic mailbox_example(bus_ifc.TB bus);

	class Generator;
		Transaction tr;
		mailbox #(Transaction) mbx;

		function new(input mailbox #(Transaction) mbx);
			this.mbx = mbx;
		endfunction : new

		task run(input int count);
			repeat (count) begin
				tr = new();
				`SV_RAND_CHECK(tr.randomize);
				mbx.put(tr);			// Send out transaction
			end
		endtask : run
	endclass : Generator	


	class Driver;

		Transaction tr;

		mailbox #(Transaction) mbx;

		function new(input mailbox #(Transaction) mbx);
			this.mbx = mbx;
		endfunction : new


		task run (input int count);
			repeat (count) begin
				mbx.get(tr);			// Fetch next transaction

				// Drive transaction here
			end
		endtask : run
	endclass : Driver



	mailbox #(Transaction) mbx;			// Mailbox connecting gen and drv

	Generator gen;
	Driver drv;
	int count;

	initial	
		begin
			mbx = new();				// Construct the mailbox
			gen = new(mbx);				// Construct the generator
			drv = new(mbx);				// Construct the driver
			count = $urandom_range(50);	// Run up to 50 transactions


			fork
				gen.run(count);			// Spawn the generator
				drv.run(count);			// Spawn the driver
			join						// Wait for both to finish
		end

endprogram