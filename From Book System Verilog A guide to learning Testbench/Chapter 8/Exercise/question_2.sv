/* Starting with the solution to Exercise 1, use the ExtBinary class to initialize
val1=15, val2=8, and print out the multiplied value.*/

class Binary;
	rand bit [3:0] val1, val2;


	// Constructor to initialize values
	function new (input bit [3:0] val1, val2);

		this.val1 = val1;
		this.val2 = val2;
	endfunction : new

	// Function to print an integer value
	virtual function void print_int(input int val);
		$display("val=0d%0d",val);
	endfunction : print_int

endclass : Binary

class ExtBinary extends Binary;

	// Constructor calling the base class constructor
	function new(input bit [3:0] val1, val2);
	 super.new(val1,val2);
	endfunction : new

	// Function to multiply val1 and val2
	function int  multiplies();
		multiplies = val1*val2;
	endfunction : multiplies
endclass : ExtBinary

module question_2;
	ExtBinary EBM;		// Object creation

		initial begin
			// Creating an instance with 4-bit values
			EBM = new(15,8);

			// Call multiples() ad store result
			int result = EBM.multiplies();

			// Print the mutliplied value
			EBM.print_int(result);

		end

endmodule : question_2