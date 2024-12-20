// Sample 5.15 The class scope resolution operator

class Transaction;
	static int count = 0;			// Number of objects created
endclass


module sample_5_15 ();
	initial
		begin
			run_test();
			$display("%0d transaction were created",Transaction :: count);	// Reference static w/o handle
		end

endmodule : sample_5_15