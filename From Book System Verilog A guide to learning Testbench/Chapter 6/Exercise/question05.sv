/*5. For the code in Sample 6.4, describe the constraints on the len, dst, and src variables.*/



class Exercise5;
    // Constant value for congestion address
    const bit [31:0] CONGEST_ADDR = 42;

    // Enum for different types of stimulus
    typedef enum {READ, WRITE, CONTROL} stim_e;

    // Random variables
    randc stim_e kind;           // Enumerated random variable
    rand bit [31:0] len, src, dst;  // 32-bit random variables
    rand bit congestion_test;    // Random bit for congestion test

    // Constraint block
    constraint c_stim {
        len < 1000;             // Length must be less than 1000
        len > 0;                // Length must be greater than 0

        // Conditional constraint based on congestion_test
        if (congestion_test) {
            // If congestion_test is true, restrict dst and src
            dst inside {[CONGEST_ADDR - 10 : CONGEST_ADDR + 10]};  // dst within a specific range
            src == CONGEST_ADDR;  // src must equal the congestion address
        }
        else {
            // If congestion_test is false, src can take values in specified ranges
            src inside {0, [2:10], [100:107]};  // src can take values from these ranges
        }
    }
endclass : Exercise5


/*Solution: The constraints limit len to between 1 and 999 inclusive. If congestion_test is 0, dst is
unconstrained and src can take on values 0, 2 to 10 inclusive, and 100 to 107 inclusive. If
congestion_test is 1, src = 42 and dst is constrained to be between 32 (42-10) and 52 (42+10)
inclusive.*/

