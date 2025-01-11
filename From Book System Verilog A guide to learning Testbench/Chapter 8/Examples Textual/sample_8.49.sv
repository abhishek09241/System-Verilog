// Sample 8.49 Test class that puts a bad transaction in the generator

class TestBad extends TestBase;

	function  new();
		env = new();
		TestRegistry::register("TestBad", this);
	endfunction : new


	virtual task run_test();
		$display("%m");
		env.gen_config();
		env.build();

		begin
			BadTr bad = new();
			env.gen.blueprint = bad;
		end

		env.run();
		env.wrap_up();
	endtask : run_test
endclass: TestBad

TestBad TestBad_handle = new();			// Declaration & constructing