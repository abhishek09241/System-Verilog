// Sample 7.36 Bounded mailbox

program automatic bounded;
	mailbox #(int) mbx;

	initial
		begin
			mbx = new(1);			// Mailbox size = 1

			fork
				
				// Producer thread
				for (int i=1; i<4; i++) begin
					$display("Producer: before put(%0d",i);
					mbx.put(i);
					$display("Producer: after put(%0d)",i);
				end

				// Consumer thread

				repeat(4) begin
					int j;
					#1ns mbx.get(j);
					$display("Consumer: after get(%0d)",j);
				end
			join
		end
endprogram



/*
Sample 7.37 Output from bounded mailbox

Producer: before put(1)
Producer: after  put(1)
Producer: before put(2)
Consumer: after  get(1)
Producer: after  put(2)
Producer: before put(3)
Consumer: after  get(2)
Producer: after put(3)
Consumer: after  get(3)
*/