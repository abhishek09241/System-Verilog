/*3. Using the solution to either Exercise 1 or 2, demonstrate its usage by generating
20 new data and address values and check for success from the constraint
solver.*/

// Define a class named Exercise3
class Exercise3;

    // Declare an 8-bit random variable 'data'
    rand bit [7:0] data;

    // Declare a 4-bit random variable 'address'
    rand bit [3:0] address;

    // Constraint to ensure 'data' is always equal to 5
    constraint c_data {
        data == 5; // 'data' is fixed to the value 5
    }

    // Constraint to define the probability distribution for 'address'
    constraint c_address {
        // Use 'dist' to specify weighted probabilities
        address dist {
            0 := 10,      // 10% probability for 'address' to be 0
            [1:14] := 80, // 80% probability for 'address' to be in the range [1:14]
            15 := 10      // 10% probability for 'address' to be 15
        };
    }

    // Method to print the values of 'data' and 'address'
    function void print_values();
        $display("Data: %0d, Address: %0d", data, address);
    endfunction

endclass : Exercise3 // End of class definition

module question3;

    // Declare an instance of Exercise3
    Exercise3 exercise_3;

    initial begin
        // Generate and display 20 sets of randomized values
        repeat (20) begin
            exercise_3 = new(); // Create a new instance
            assert(exercise_3.randomize()) 
                else $fatal("exercise_3.randomization failed");

            // Call the method to display the generated values
            exercise_3.print_values();
        end
    end

endmodule : question3
