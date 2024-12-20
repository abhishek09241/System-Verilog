// Sample 5.11 Routines in class

class Transaction;
	bit	[31:0] addr,csm,data[8];
	function void display();
		$display("@%0t: TR addr=%h,csm=%h,data=%p",$time,addr,csm,data);
	endfunction : display
endclass : Transaction


class PCI_Tran;
	bit [31:0] addr,data;		//Use realistic names 
	function void display();
		$display("@%ot: PCI: addr=%h, data=%h",$time,addr,data);
	endfunction : display
endclass : PCI_Tran

module sample_5_11;
	Transaction t;
	PCI_Tran pc;

	initial
		begin
			t = new();			// Construct a transaction
			t.display();		// Display a Transaction
			pc = new();			// Construct a PCI Transaction
			pc.display();		// Displaya PCI Transaction
		end

endmodule : sample_5_11