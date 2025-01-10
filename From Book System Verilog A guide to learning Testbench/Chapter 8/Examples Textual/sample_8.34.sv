// Sample 8.34 Parameterized generator class using blueprint pattern

class Generator #(type T=BaseTr);
		mailbox #(Transaction) gen2driv;
		T blueprint;					// Blueprint object


		function new(input mailbox #(Transaction) gen2driv);
			this.gen2driv = gen2driv;
			blueprint	  = new();			// Create default
		endfunction : new


		task run(input int num_tr = 10);
			T tr;

			repeat (num_tr) begin
				`SV_RAND_CHECK(blueprint.randomize);
				$cast(tr,blueprint.copy());			// Make a copy
				gen2driv.put(tr);					// Send to driver
			end
		endtask : run
endclass:Generator