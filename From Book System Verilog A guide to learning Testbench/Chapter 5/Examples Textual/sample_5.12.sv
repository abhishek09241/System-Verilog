// Sample 5.12 Out-of-block method declarations

class Transaction;
	bit [31:0] addr, csm, data[8];
	extern function void display();
endclass : Transaction


function void Transaction::display();
	$display("@%0t: Transaction addr = %h, csm=%h, data=%p",
				$time, addr, csm, data);
endfunction 


class PCI_Tran;
	bit [31:0] addr, data;	// Use realistic name
	extern function void display();
endclass:PCI_Tran

function void PCI_Tran::display();
	$display("@%0t: PCI: addr = %h, data = %h",$time,addr,data);
endfunction 
 