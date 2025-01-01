//Sample 6.2 Randomization check macro and example


// Macro definition to check randomization result
`define SV_RAND_CHECK(r) \
    do begin \
        // If randomization fails (r is false), display error and stop simulation
        if((!r)) begin \
            // Display the file name, line number, and the failed randomization statement
            $display("%s: %0d: Randomization failed \"%s\"", \
                `__FILE__, `__LINE__, `"r`"); \
            // Stop the simulation
            $finish; \
        end \
    end while (0)  // End of do-while loop

// Class definition for Packet
class Packet;
    // Declare random variables for the packet
    rand bit [31:0] src;  // 32-bit source address
    rand bit [31:0] dst;  // 32-bit destination address
    rand bit [31:0] data[8];  // Array of 8 32-bit data elements
    randc bit [7:0] kind;  // 8-bit kind field, with cyclic randomization (randc)

    // Constraint to limit the values for the src field
    constraint c { 
        src > 10;  // src must be greater than 10
        src < 15;  // src must be less than 15
    }
endclass : Packet

// Testbench module
module sample_6_2;
    Packet p;  // Declare a Packet object

    initial begin
        // Create a new instance of the Packet class
        p = new();  
        
        // Randomize the Packet object and check if the randomization was successful
        `SV_RAND_CHECK(p.randomize());  // Use the macro to check if randomization succeeded
    end
endmodule : sample_6_2
