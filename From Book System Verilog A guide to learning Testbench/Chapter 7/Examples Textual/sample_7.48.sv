// Sample 7.48 Environment class

class Environment;

	Generator  gen;
	Agent	   agt;
	Driver     drv;
	Monitor    mon;
	Checker    chk;
	Scoreboard scb;
	Config     cfg;

	mailbox #(Transaction) gen2agt, agt2drv, mon2chk;


	extern function new();
	extern function void gen_cfg();
	extern function void build();
	extern task run();
	extern task wrap_up();
	
endclass : Environment


function Environment::new();
	cfg = new();
endfunction : new

function void Environment::gen_cfg();
	`SV_RAND_CHECK(cfg.randomize);
endfunction : gen_cfg


function void Environment:: build();
	// Initialize mailboxes

	gen2agt = new();
	agt2drv = new();
	mon2chk = new();


	// Initialize transactors

	gen = new(gen2agt);
	agt = new(gen2agt,agt2drv);
	drv = new(agt2drv);
	mon = new(mon2chk);
	chk = new(mon2chk);
	scb = new(cfg);
endfunction : build


task Environment::run();
	fork
		gen.run(cfg.run_for_n_trans);
		agt.run;
		drv.run;
		mon.run;
		chk.run;
		scb.run(cfg.run_for_n_trans);
	join
endtask : run


task Environment:: wrap_up();
	fork
		gen.wrap_up();
		agt.wrap_up();
		drv.wrap_up();
		mon.wrap_up();
		chk.wrap_up();
		scb.wrap_up();
	join
endtask : wrap_up



//  Chapter 8 shows more details on how to build these classes.