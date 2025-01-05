/*1. Write the SystemVerilog code for the following items.
a. Create a class Exercise1 containing two random variables, 8-bit data and
4-bit address. Create a constraint block that keeps address to 3 or 4.
b. In an initial block, construct an Exercise1 object and randomize it.
Check the status from randomization.*/


// Define a class named Exercise1
class Exercise1;

    // Declare an 8-bit random variable 'data'
    rand bit [7:0] data;

    // Declare a 4-bit random variable 'address'
    rand bit [3:0] address;

    // Define a constraint block to restrict the value of 'address'
    // The 'address' should be either 3 or 4
    constraint c_address {
        address inside {[3:4]}; // Constraint using 'inside' construct
    }

    // Alternate ways to define the same constraint (commented out):
    // constraint c_address {
    //     address > 2; // 'address' should be greater than 2
    //     address < 5; // 'address' should be less than 5
    // }
    //
    // constraint c_address {
    //     ((address == 3) || (address == 4)); // Explicitly check for 3 or 4
    // }

endclass : Exercise1 // End of class definition

// Define a module named question1
module question1;

    // Declare a variable of type Exercise1
    Exercise1 exercise_1;

    initial begin
        // Create a new object of the Exercise1 class
        exercise_1 = new();

        // Randomize the object and check the randomization status
        assert(exercise_1.randomize()) 
            else $fatal(0, "exercise_1.randomize failed"); // Terminate simulation if randomization fails
    end

endmodule : question1 // End of module
