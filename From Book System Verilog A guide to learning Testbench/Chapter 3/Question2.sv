// 2. For the following SystemVerilog code, what is displayed if the task my_task2() is automatic?


module Question2 (); // Module declaration, no input/output ports

    // Declare two integer variables to store the results from the task
    int new_address1, new_address2;

    // Declare a bit variable to represent the clock signal
    bit clk;

    // Initial block where simulation starts
    initial
    begin
        // Fork block to run both tasks concurrently
        fork
            // Call my_task2 with address 21 and store the result in new_address1
            my_task2(21, new_address1); 
            
            // Call my_task2 with address 20 and store the result in new_address2
            my_task2(20, new_address2);            
        join // Wait for both tasks to complete before proceeding

        // Display the values of new_address1 and new_address2 after tasks finish
        $display("new_address1 = %0d", new_address1); 
        $display("new_address2 = %0d", new_address2); 
    end

    // Generate a clock signal that toggles every 50 time units
    initial
    forever #50 clk = !clk; 

    // Task definition with automatic keyword to ensure reentrancy
    task automatic my_task2(input int address, output int new_address);
        @(clk); // Wait for the rising edge of the clock signal (clk)
        new_address = address; // Assign the input address value to the output new_address
    endtask: my_task2




endmodule : Question2


// ***************Note********* In question 3rd remove automatic keyword ***********************//