// Sample 5.19 Class uses wrong variable

program automatic test;

	int i;				// Progra, level variable


	class Bad;
		logic [31:0] data [];		// Dynamic array declaration

		// Calling this function changes the program varibale i

		function void display();
			// Forgot to declare i in next statement
			for (int i = 0; i < data.size(); i++) 
				begin
					$display("data[%0d]=%x",i,data[i]);
				end	
		endfunction : display
	endclass: Bad
endprogram