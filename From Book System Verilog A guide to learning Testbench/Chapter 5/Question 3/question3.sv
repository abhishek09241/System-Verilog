/*3. Using the MemTrans class from Exercise 1, create a custom constructor so that
data_in and address are both initialized to 0 but can also be initialized through
arguments passed into the constructor. In addition, write a program to perform
the following tasks.
a. Create two new MemTrans objects.
b. Initialize address to 2 in the first object, passing arguments by name.
c. Initialize data_in to 3 and address to 4 in the second object, passing argu-
ments by name.*/


// Define a class called MemTrans
class MemTrans;
    // Declare an 8-bit logic variable for data_in
    logic [7:0] data_in;

    // Declare a 4-bit logic variable for address
    logic [3:0] address;

    // Define a function to print the values of data_in and address
    function void print();
        // Use $display to print the values in hexadecimal format
        $display("Data_in = %h, address =%h", data_in, address);        
    endfunction : print

    // Define a constructor with default initialization for data_in and address
    // Allows initialization through arguments passed by name
    function new(input logic [7:0] data_init = 0, input logic [3:0] address_init = 0);
        // Initialize data_in and address with the passed values or defaults
        data_in = data_init;
        address = address_init;
    endfunction : new    
endclass : MemTrans

// Define a module to test the MemTrans class
module question3;

    // Use an initial block for simulation
    initial
        begin
            // Declare two objects of the MemTrans class
            MemTrans Mymemtrans1, Mymemtrans2;

            // Instantiate the first object, initializing address to 2 using named arguments
            Mymemtrans1 = new(.address_init(2));

            // Instantiate the second object, initializing data_in to 3 and address to 4 using named arguments
            Mymemtrans2 = new(.data_init(3), .address_init(4));

            // Call the print function for the first object to display its values
            Mymemtrans1.print();

            // Call the print function for the second object to display its values
            Mymemtrans2.print();
        end

endmodule : question3
