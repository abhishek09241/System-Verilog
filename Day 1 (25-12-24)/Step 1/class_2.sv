`include "package_1.sv"			// Including the package_1.sv file where package_1 is defined
	`define DATA 1 				// Defining a macro for DATA with value 1

		import pkg_1:: package_1;	// Importing the package_1 from the package pkg_1

	module class_2 ;
		import uvn_pkg::*;			// Importing all components from the UVM package
		
		package_1 pkg_h;			// Declaring a handle to the package_1 class

			int data_1;

				initial 					// Initial block to execute at the start of simulation
					begin
						pkg_h = new();		// Creating an instance of the package_1 class


						data_1 = `DATA;		// Assigning the value of the macro `DATA to data_1

						// Printing a UVM info message with severity UVM_LOW
						`uvm_info("", $sformatf(" data_1 is %0d", data_1), UVM_LOW)
					end
	
	endmodule : class_2
		