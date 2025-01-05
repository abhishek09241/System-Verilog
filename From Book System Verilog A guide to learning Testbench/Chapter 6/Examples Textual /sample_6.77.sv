// Sample 6.77 Building environment with random configuration

class Environment;

	EthCfg  cfg;
	EthGen  gen[4];
	EthMii	drv[4];


	function new();
		cfg = new();				// Construct the cfg
	endfunction

	// Use random configuration to build the environment

	function void build();
		foreach (gen[i]) begin
			gen[i] = new();
			drv[i] = new();
			if (cfg.is_100[i])
				drv[i].set_speed(100);
		end
		
	endfunction : build

	function void gen_cfg();
		`SV_RAND_CHECK(cfg.randomize());			// Randomize the cfg
	endfunction : gen_cfg

	task run();
			foreach (gen[i]) begin
						if (cfg.in_use[i]) begin
							// Only start the testbench transactors that are in use

							gen[i].run();
						end
					end		
	endtask : run


	task wrap_up();
		// Not currently used
	endtask : wrap_up
endclass : Environment