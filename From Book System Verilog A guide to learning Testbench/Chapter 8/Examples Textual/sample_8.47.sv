// Sample 8.47 Simple test in a class

// Repeat for each test

class TestSimple extends TestBase;

	function new();
		env = new();
		TestRegistry::register("TestSimple", this);
	endfunction : new

	virtual task run_test();
		$display("%m");
		env.gen_config();
		env.build();
		env.run();
		env.wrap_up();
	endtask : run_test
endclass: TestSimple

TestSimple 		TestSimple_handle = new();			// Needed for each class