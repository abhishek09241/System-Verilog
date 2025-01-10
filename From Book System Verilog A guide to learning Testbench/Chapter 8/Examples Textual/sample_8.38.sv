// Sample 8.38 Transactor class with dynamic print object

class Xactor;
	Print p;

	function new();
			p = new("Xactor", "solo");
	endfunction: new

	task run();
		p.error("NYI", "This Xactor is not yet implemented");
	endtask : run
endclass