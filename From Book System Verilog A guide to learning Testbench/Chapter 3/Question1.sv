/*1. Create the SystemVerilog code with the following requirements:
a. Create a 512 element integer array
b. Create a 9-bit address variable to index into the array
c. Initialize the last location in the array to 5
d. Call a task, my_task(), and pass the array and the address
e. Create my_task() that takes two inputs: a constant 512-element integer array
passed by reference, and a 9-bit address. The task calls a function, print_
int(), and passes the array element indexed by the address, pre-decrementing
the address.
f. Create print_int() that prints out the simulation time and the value of the
input. The function has no return value.*/


module Question1 ();
module Question1 (); // Module definition

	// Declare a 512-element integer array
	integer array [0:511];

	// Declare a 9-bit address variable
	logic  [8:0] address;

	// Initial block where simulation starts
	initial
		begin
			// Initialize the last element of the array to 5
			array[511] = 5;

			// Call the task my_task, passing the array and address
			my_task(array, address);
		end

	// Task definition, with automatic keyword to allow reentrancy
	task automatic my_task(ref integer array[0:511], input logic [8:0] address);
		integer value; // Declare a local integer variable to hold the value

		begin
			// Access the array element at the pre-decremented address
			value = array[address-1];

			// Call the print_int function to display the value
			print_int(value);
		end
	endtask : my_task

	// Function definition to print the value with simulation time
	function void print_int(input integer value);
		begin
			// Display the simulation time and the value passed to the function
			$display("Simulation Time : %t, Value: %d", $time, value);
		end		
	endfunction : print_int	

endmodule : Question1
