// Sample 8.27 Driver class with callbacks

class Driver;
		Driver_cbs cbs[$];				// Queue of callback objects

		task run();
			bit drop;
			Transaction tr;

			forever begin
				drop = 0;
				agt2drv.get(tr);		// Agent to driver mailbox
				foreach (cbs[i]) cbs[i].pre_tx(tr, drop);
				if(drop) continue;
				transmit (tr);			// Actual work
				foreach (cbs[i]) cbs[i].post_tx(tr);
			end
		endtask : run
endclass : Driver