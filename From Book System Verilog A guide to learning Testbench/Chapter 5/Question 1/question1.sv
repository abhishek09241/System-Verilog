/*1. Create a class called MemTrans that contains the following members, 
   then construct a MemTrans object in an initial block.
a. An 8-bit data_in of logic type
b. A 4-bit address of logic type
c. A void function called print that prints out the value of data_in and address*/

// Define a class called MemTrans
class MemTrans;
    // Declare a 8-bit logic variable for data_in
    logic [7:0] data_in;

    // Declare a 4-bit logic variable for address
    logic [3:0] address;

    // Define a function to print the values of data_in and address
    function void print();
        // Use $display to print the values in hexadecimal format
        $display("Data_in = %h, address = %h", data_in, address);
    endfunction : print
endclass : MemTrans

// Define a module to test the MemTrans class
module question1;

    // Use an initial block for simulation
    initial
        begin
            // Declare an object of the MemTrans class
            MemTrans Mymemtrans;

            // Instantiate the object using the new() constructor
            Mymemtrans = new();   
            
            // Note: data_in and address are not initialized, so their values are 'x' by default.
            // You can call Mymemtrans.print() here to display the values if desired.
        end

endmodule : question1
