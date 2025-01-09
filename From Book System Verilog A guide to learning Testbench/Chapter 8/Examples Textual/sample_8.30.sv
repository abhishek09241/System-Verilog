// Sample 8.30 Test using callback for scoreboard


class Driver_cbs_scoreboard extends Driver_cbs;
	Scoreboard scb;


	virtual task pre_tx(ref Transaction tr, ref bit drop);
		// Put transaction in the scoreboard
		scb.save_expected(tr);
	endtask : pre_tx


	function new(input Scoreboard scb);
		this.scb = scb;
	endfunction : new
endclass:Driver_cbs_scoreboard


program automatic test;
	Environment env;

	initial 
		begin
			env = new();
			env.gen_cfg();
			env.build();

			begin 							// Create scoreboard callback
				Driver_cbs_scoreboard dcs = new(env.scb);
				env.drv.cbs.push_back(dcs);			// Put into driver's Q
			end

			env.run();
			env.wrap_up();
		end

endprogram