`include "uvm_macros.svh"   // Including the UVM macros file for using UVM functionality

package pkg_1;				// Declaring the package named pkg_1
	import uvm_pkg::*;		// Importing all the UVM package components
		class package_1;	// Declaring the class name as package_1

			// Constructor function for the class
			function new();
				
			// Displaying a simple message on the terminal using $display
            // $display is a SystemVerilog function used for printing messages to the console.
            // It is typically used for debugging and general output.
				$display("ABC");
				

			// UVM info message with severity level UVM_NONE
            // `uvm_info is a UVM macro used for printing information messages(such as line number and so on) with specific severity.
            // It is more structured and used for logging in UVM-based testbenches.
            // The first argument is a tag (often empty), the second is the message,
            // and the third is the severity level (UVM_NONE here means no severity). 
				`uvm_info(" ", "This is importing uvm pkg from uvm macros", UVM_NONE)

			endfunction : new
			
		endclass : package_1
	
endpackage : pkg_1