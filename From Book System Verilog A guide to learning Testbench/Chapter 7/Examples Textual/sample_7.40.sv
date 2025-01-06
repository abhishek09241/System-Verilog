// Sample 7.40 Producer - consumer synchronized with bounded mailbox

program automatic synch_peek;

	class Producer;
		task run();
			for (int i = 1; i < 4; i++) begin
				$display("Producer: before put(%0d)",i);
				mbx.put(i);
			end
		endtask : run
	endclass : Producer

	mailbox #(int) mbx;

	class Consumer;
		task run();
			int i;
			repeat (3) begin
				mbx.peek(i);		// Peek integer from mbx
				$display("Consumer: after get(%0d)", i);
				mbx.get(i);			// Get ineteger from mbx				
			end
		endtask : run
	endclass : Consumer


	Producer p;
	Consumer c;

	initial
		begin
			// Construct mailbox, producer, consumer

			mbx = new(1);				// Bounded mailbox - limit 1!
			p   = new();
			c   = new();


			// Run the producer and consumer in parallel

			fork
				p.run();
				c.run();
			join
		end
endprogram


/*
Sample 7.41 Output from producer-consumer with bounded mailbox

Producer: before put(1)
Producer: before put(2)
Consumer: after  peek(1)
Consumer: after  peek(2)
Producer: before put(3)
Consumer: after  peek(3)
*/