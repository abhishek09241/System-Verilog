// Sample 8.45 Base test class

virtual class TestBase;
	Environment env;
	pure virtual task run_test();

	function new();
		env = new();
	endfunction : new

endclass : TestBase