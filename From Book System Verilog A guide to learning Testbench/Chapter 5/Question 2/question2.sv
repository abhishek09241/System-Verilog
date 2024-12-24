/*2. Using the MemTrans class from Exercise 1, create a custom constructor, the new function, so that data_in and address are both initialized to 0.*/


class MemTrans;
    logic [7:0] data_in;
    logic [3:0] address;

    // Constructor with  initialization 0
    function new ();
		data_in = 8'h0;
		address = 4'h0;
	endfunction : new

    // Print function
    function void print();
        $display("Data_in = %h, address = %h", data_in, address);
    endfunction : print
endclass : MemTrans

module question2;

    initial begin
        MemTrans Mymemtrans;
        Mymemtrans = new(); // Calls the constructor with default values
        Mymemtrans.print(); // Prints initialized values
    end

endmodule : question2
