// Sample 7.34 Good driver receives transactions from mailbox

task driver(input mailbox #(Transaction) mbx);
	Transaction tr;
	forever begin
		mbx.get(tr);				// Get transaction from mailbox
		$display("DRV: Received addr=%h", tr.addr);

		// Drive transaction into DUT
	end
	
endtask : driver