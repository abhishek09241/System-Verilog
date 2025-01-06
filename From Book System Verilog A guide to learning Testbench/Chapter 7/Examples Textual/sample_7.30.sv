// Sample 7.30 Semaphores controlling access to hardware resource

program automatic test (bus_ifc.TB bus);

	semaphore sem;			// Create a semaphore

	initial
		begin
			sem = new(1);			// Allocate with 1 key
			fork
				sequencer();		// Spawn two threads that both
				sequencer();		// do bus transactions
			join
		end

		task sequencer();
			repeat($urandom()%10)		// Random wait, 0-9 cycles
			@bus.cb;
			sendTrans();				// Execute the transaction
		endtask : sequencer

		task sendTrans();
			sem.get(1);					// Get the key to the bus
			@bus.cb;					// Drive signals onto bus
			bus.cb.addr <= tr.addr;	

			///
			sem.put(1);					// Put it back when done
		endtask : sendTrans
endprogram