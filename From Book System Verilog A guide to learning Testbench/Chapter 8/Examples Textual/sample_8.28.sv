// Sample 8.28 Test using a callback for error injection

class Driver_cbs_drop extends Driver_cbs;

	virtual task pre_tx(ref Transaction tr, ref bit drop);
		// Randomly drop 1 out of every 100 transactions


		drop = ($urandom_range(0,99)==0);
	endtask: pre_tx
endclass: Driver_cbs_drop


program automatic test;
	Environment env;

	initial
		begin
			env = new();
			env.gen_cfg();
			env.build();

			begin 				// Create error injection callback
				Driver_cbs_drop dcd = new();
				env.drv.cbs.push_back(dcd);		// Put into driver's Q
			end

			env.run();
			env.wrap_up();
		end

endprogram