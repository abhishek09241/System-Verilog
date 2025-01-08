// Sample 8.6 Generator class using blueprint pattern


// `include "sample_8.1.sv"
class Generator;

	mailbox #(Transaction) gen2driv;

	Transaction blueprint;

	function new(input mailbox #(Transaction) gen2driv);
		this.gen2driv=gen2driv;
		blueprint =new();
	endfunction : new


	virtual task run(input int num_tr=10);

		repeat(num_tr) begin
			void'(blueprint.randomize);
			//gen2driv.put(blueprint.copy());			// Send copy to te driver
		end		
	endtask : run
endclass:Generator