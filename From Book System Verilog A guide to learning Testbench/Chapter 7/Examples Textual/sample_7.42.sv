// Sample 7.42 PProducer- consumer synchronized with an event

program automatic mbx_evt;
	mailbox #(int) mbx;
	event handshake;


	class Producer;
		task run();
			for (int i = 1; i < 4; i++) begin
				$display("Producer: before put(%0d)", i);
				mbx.put(i);
				@handshake;
				$display("Producer: after put(%0d)",i);
			end
		endtask : run
	endclass : Producer

	class Consumer;
		task run();
			int i;
			repeat (3) begin
				mbx.get(i);
				$display("Consumer: after get(%0d)",i);
				->handshake;
			end
		endtask : run
		
	endclass : Consumer

	Producer p;
	Consumer c;

	initial
		begin
			p 	= new();
			c 	= new();
			mbx = new();


			// Run the producer and consumer in parallel

			fork
				p.run();
				c.run();
			join
		end
endprogram




/*
Sample 7.43 Output from producer-consumer with event


Producer: before put(1)
Consumer: after  get(1)
Producer: after  put(1)
Producer: before put(2)
Consumer: after  get(2)
Producer: after  put(2)
Producer: before put(3)
Consumer: after  get(3)
Producer: after  put(3)
*/