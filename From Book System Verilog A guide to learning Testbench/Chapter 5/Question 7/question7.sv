/*7. Given the following code, complete the function print_all in class MemTrans
to print out data_in and address using the class PrintUtilities.
Demonstrate using the function print_all.*/

class PrintUtilities;

	function void print_4(input string name,
						  input [3:0] val_4bits);

		$display("%t: %s = %h", $time, name, val_4bits);
		
	endfunction : print_4

	function void print_8(input string name,
						  input [7:0] val_8bits);
		$display("%t: %s = %h",$time,name, val_8bits);
		
	endfunction : print_8
	
endclass : PrintUtilities

class MemTrans;
	bit [7:0] data_in;
	bit [3:0] address;
	PrintUtilities print;

	function new ();
		print = new();
	endfunction : new

	function void print_all;

		print.print_4("data_in", data_in);
		print.print_8("address", address);
		
	endfunction : print_all
	
endclass : MemTrans

module question7;

    initial begin
        MemTrans Mymemtrans;
        Mymemtrans = new(); // Calls the constructor with default values
        Mymemtrans.print_all(); // Prints initialized values
    end

endmodule : question7