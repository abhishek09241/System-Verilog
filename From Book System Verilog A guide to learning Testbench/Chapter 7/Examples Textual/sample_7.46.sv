// Sample 7.46 Basic Transactor


class Agent;

	mailbox #(Transaction) gen2agt, agt2drv;
	Transaction tr;


	function  new(input mailbox #(Transaction) gen2agt, agt2drv);
		this.gen2agt = gen2agt;
		this.agt2drv = agt2drv;
	endfunction : new

	task run();
		forever begin
			gen2agt.get(tr);					// Get transaction from upstream block
			/// Do some processing
			agt2drv.put(tr);					// Send it to downstream block
		end
	endtask : run

	task wrap_up();			// Empty fow now
	endtask : wrap_up

	
endclass : Agent
