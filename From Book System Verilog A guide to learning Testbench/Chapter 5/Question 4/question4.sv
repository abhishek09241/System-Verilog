/*4. Modify the solution from Exercise 3 to perform the following tasks.
a. After construction, set the address of the first object to 4’hF.
b. Use the print function to print out the values of data_in and address for
   the two objects.
c. Explicitly deallocate the 2nd object.*/

class MemTrans;
	logic [7:0] data_in;
	logic [3:0] address;

	function void print();
		$display("data_in = %h, address = %h", data_in, address);
	endfunction : print

	function new (input logic [7:0] data_init = 0, input logic address_init = 0);
		data_in = data_init;
		address = address_init;
	endfunction : new
endclass : MemTrans

module question4;

	initial
		begin
			MemTrans Mytrans1, Mytrans2;
			Mytrans1 = new(.address_init(2));
			Mytrans1.address = 4'hf;
			Mytrans2 = new(.data_init(3), .address_init(4));
			Mytrans1.print();
			Mytrans2.print();
			Mytrans2 = null;
		end

endmodule : question4