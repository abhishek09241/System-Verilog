// Sample 5.17 Static method displays static variable

class Transaction;
	static Config cfg;				// A handle with static storage
	static int count = 0;			// Intialize static variable durin declaration
	int id;							// Non static variables


	// Static method to display static variables.

	static function void display_statics();
		if(cfg == null)
				$display("ERROR: Configuration is not set");
		else
				$display("Transaction cfg.num_trans=%0d", count=%0d,
						   cfg.num_trans, count);
	endfunction

endclass

module sample_5_17;
	Config cfg;

	initial
		begin
			cfg = new(.num_trans(42));			// Pass argument by name
			Transaction::cfg = cfg;
			Transaction::display_statics();		// Static method call
		end

endmodule : sample_5_17