/*4. Modify the solution from Exercise 3 to perform the following tasks.
a. After construction, set the address of the first object to 4’hF.
b. Use the print function to print out the values of data_in and address for
   the two objects.
c. Explicitly deallocate the 2nd object.*/

// Define a class called MemTrans
class MemTrans;
    // Declare an 8-bit logic variable for data_in
    logic [7:0] data_in;

    // Declare a 4-bit logic variable for address
    logic [3:0] address;

    // Define a function to print the values of data_in and address
    function void print();
        // Use $display to print the values in hexadecimal format
        $display("data_in = %h, address = %h", data_in, address);
    endfunction : print

    // Define a constructor with default initialization for data_in and address
    // Allows initialization through arguments passed by name
    function new (input logic [7:0] data_init = 0, input logic [3:0] address_init = 0);
        // Initialize data_in and address with the passed values or defaults
        data_in = data_init;
        address = address_init;
    endfunction : new
endclass : MemTrans

// Define a module to test the MemTrans class
module question4;

    // Use an initial block for simulation
    initial
        begin
            // Declare two objects of the MemTrans class
            MemTrans Mytrans1, Mytrans2;

            // Instantiate the first object, initializing address to 2 using named arguments
            Mytrans1 = new(.address_init(2));

            // Modify the address of the first object to 4'hF after construction
            Mytrans1.address = 4'hf;

            // Instantiate the second object, initializing data_in to 3 and address to 4 using named arguments
            Mytrans2 = new(.data_init(3), .address_init(4));

            // Call the print function for the first object to display its values
            Mytrans1.print();

            // Call the print function for the second object to display its values
            Mytrans2.print();

            // Explicitly deallocate the second object by setting it to null
            Mytrans2 = null;
        end

endmodule : question4
