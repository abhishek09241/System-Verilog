/*2. Modify the solution for Exercise 1 to create a new class Exercise2 so that:
a. data is always equal to 5
b. The probability of address==0 is 10%
c. The probability of address being between [1:14] is 80%
d. The probability of address==15 is 10%*/



// Define a class named Exercise2
class Exercise2;

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

    // Alternate way to define the same probability distribution (commented out):
    // constraint c_address {
    //     address dist {
    //         0 :/ 10,      // Alternative syntax using '/' for weights
    //         [1:14] :/ 80,
    //         15 :/ 10
    //     };
    // }

endclass : Exercise2 // End of class definition
