/*6. Using the solution from Exercise 5, create a static method called print_last_
address that prints out the value of the static variable last_address. After
allocating objects of class MemTrans, call the method print_last_address
to print out the value of last_address.*/

// Define a class called MemTrans
class MemTrans;
    // Declare an 8-bit logic variable for data_in
    logic [7:0] data_in;

    // Declare a 4-bit logic variable for address
    logic [3:0] address;

    // Declare a static 4-bit logic variable for last_address
    // This stores the address of the most recently created object
    static logic [3:0] last_address;

    // Define a function to print the values of data_in and address
    function void print();
        // Use $display to print the values in hexadecimal format
        $display("Data_in = %h, address = %h", data_in, address);
    endfunction : print

    // Define a constructor with default initialization for data_in and address
    // Allows initialization through arguments passed by name
    function new (input logic [7:0] data_init = 0, input logic [3:0] address_init = 0);
        // Initialize data_in and address with the passed values or defaults
        data_in = data_init;
        address = address_init;

        // Update the static variable last_address with the current object's address
        MemTrans::last_address = address;
    endfunction : new

    // Define a static method to print the value of last_address
    static function void print_last_address();
        // Use $display to print the value of last_address in hexadecimal format
        $display("last_address is %h", last_address);
    endfunction : print_last_address
endclass : MemTrans

// Define a module to test the MemTrans class
module question6;

    // Use an initial block for simulation
    initial
        begin
            // Declare two objects of the MemTrans class
            MemTrans Mymemtrans1, Mymemtrans2;

            // Instantiate the first object, initializing address to 2 using named arguments
            Mymemtrans1 = new(.address_init(2));

            // Modify the address of the first object to 4'hF after construction
            // Note: This does not affect last_address since it was set during construction
            Mymemtrans1.address = 4'hF;

            // Instantiate the second object, initializing data_in to 3 and address to 4 using named arguments
            Mymemtrans2 = new(.data_init(3), .address_init(4));

            // Call the print function for the first object to display its values
            Mymemtrans1.print();

            // Call the print function for the second object to display its values
            Mymemtrans2.print();

            // Explicitly deallocate the second object by setting it to null
            Mymemtrans2 = null;

            // Display the value of the static variable last_address directly
            $display("Last Address is %h", MemTrans::last_address);

            // Call the static method print_last_address to display last_address
            MemTrans::print_last_address();
        end

endmodule : question6
