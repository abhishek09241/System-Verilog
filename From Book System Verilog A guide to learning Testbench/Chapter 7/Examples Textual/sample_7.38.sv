// Sample 7.38 Producer- consumer without synchronization

program automatic unsynchronized;
	mailbox #(int) mbx;

	class Producer;
		task run();
			for (int i = 1; i < 4; i++) begin
				$display("Producer: before put(%0d)",i);
				mbx.put(i);
			end
		endtask : run
	endclass : Producer

	class Consumer;
		task run();
			int i;
			repeat (3) begin
				mbx.get(i);			// Get ineteger from mbx
				$display("Consumer: after get(%0d)", i);
			end
		endtask : run
	endclass : Consumer


	Producer p;
	Consumer c;

	initial
		begin
			// Construct mailbox, producer, consumer

			mbx = new();				// Unbounded
			p   = new();
			c   = new();


			// Run the producer and consumer in parallel

			fork
				p.run();
				c.run();
			join
		end
endprogram


/*The above sample holds the mailbox in a global variable to make the code more
compact. In real code, you should pass the mailbox into the class through the con-
structor and save a reference to it in a class-level variable.*/



/*
Sample 7.39 producer-consumer without synchronization output

Producer: before put(1)
Producer: before put(2)
Producer: before put(3)
Consumer: after  get(1)
Consumer: after  get(2)
Consumer: after  get(3)

*/