// Sample 5.20 Move class into package to find bug

package Better;
	class Bad ;
		logic [31:0] data[];

		// ** Will not compile because of undeclared i
		function void display();
			for (int i = 0; i < data.size(); i++) 
				begin
					$display("data[%0d]=%x",i,data[i]);
				end
		endfunction : display
	endclass : Bad
endpackage : Better


program automatic test;
	int i;				// Program level variable
	import Better::*;
	// ,........
endprogram