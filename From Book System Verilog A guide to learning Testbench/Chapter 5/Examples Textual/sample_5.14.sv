// Sample 5.14 Class with a static variable

class Transaction;
	static int count = 0;		// Number of objects created
	int id;						// Unique instance ID

	function new();
		id = count++;			// Set ID, bump count
	endfunction : new
	
endclass : Transaction

module sample_5_14();

	Transaction t1,t2;
	initial
		begin
			t1 = new();				// 1st instance, id=0, count=1
			$display("First id=%0d, count=%0d", t1.id, t1.count);
			t2 = new();
			$display("Second id=%0d, count=%0d", t2.id, t2.count);
		end

endmodule : sample_5_14