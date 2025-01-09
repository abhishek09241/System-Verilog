// Sample 8.25 Transaction class extends abstract class

`include "sample_8.24.sv"
class Transaction extends BaseTr;
	rand bit [31:0] src, dst, csm, data[8];


	extern function new();
	extern virtual function bit compare(input BaseTr to);
	extern virtual function BaseTr copy(input BaseTr to=null);
	extern virtual function void display(input string prefix="");

endclass


function Transaction:: new();
	super.new();
endfunction : new



function bit Transaction ::compare(input BaseTr to);
	Transaction tr;
	if(!$cast(tr,to))				// Check if 'to' is correct type
		$finish;
	return	((this.src  == tr.src) &&
			 (this.dst  == tr.dst) &&
			 (this.csm  == tr.csm) &&
			 (this.data == tr.data));
endfunction : compare


function BaseTr Transaction ::copy(input BaseTr  to =null );
	Transaction cp;
	if(to == null) cp = new();
	else $cast(cp,to);
	cp.src = this.src;			// Copy the data fields
	cp.dst = this.dst;
	cp.csm = this.csm;
	cp.data = this.data;
	return cp;
endfunction : copy

function void Transaction:: display(input string prefix="");
	$display("%sTransaction %0d src=%h, dst=%x, csm=%x", prefix, id, src,dst,csm);
endfunction : display
