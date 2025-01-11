// Sample 8.48 Program block for test classes

program automatic test;

	TestBase tb;
	initial
		begin
			tb = TestRegistry::get_test();
			tb.run_test();
		end
endprogram