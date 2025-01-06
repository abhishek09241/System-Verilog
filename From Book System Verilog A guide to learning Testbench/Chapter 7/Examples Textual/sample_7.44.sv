// Sample 7.44 Producer-consumer synchronized with a mailbox

program automatic mbx_mbx2;
	mailbox #(int) mbx, rtn;

	class Producer;
		task run();
			int k;
			for (int i = 1; i < 4; i++) 
				begin
					$display("Producer: before put(%0d)",i);
					mbx.put(i);
					rtn.get(k);
					$display("Producer: after get(%0d)",k);					
				end			
		endtask : run
	endclass : Producer



	class Consumer;
		task run();
			int i;
			repeat(3)
				begin
					$display("Consumer: before get");
					mbx.get(i);
					$display("Consumer: after get(%0d)",i);
					rtn.put(-i);
				end
		endtask : run
		
	endclass : Consumer


	Producer p;
	Consumer c;

	initial
		begin
			p = new();
			c = new();
			mbx = new();
			rtn = new();


			// Run the producer and consumer in parallel

			fork
				p.run();
				c.run();
			join
		end

endprogram



/*
Sample 7.45 Output from producer-consumer with mailbox

Producer: before put(1)
Consumer: before get
Consumer: after  get(1)
Consumer: before get
Producer: after  get(-1)
Producer: before put(2)
Consumer: after  get(2)
Consumer: before get
Producer: after  get(-2)
Producer: before put(3)
Consumer: after  get(3)
Producer: after  get(-3)

*/