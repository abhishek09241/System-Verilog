// Sample 5.16 Static storage for a handle

class Transaction;
	static Config cfg;			// A handle with static storage	
endclass :  Transaction

module sample_5_16;
	initial
		begin
			Transaction :: cfg = new(.num_trans(42));
		end

endmodule : sample_5_16