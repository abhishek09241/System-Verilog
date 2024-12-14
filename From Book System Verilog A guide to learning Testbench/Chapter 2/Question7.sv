/*Write code for the following problems.
a. Create memory using an associative array for a processor with a word width of
24 bits and an address space of 220 words. Assume the PC starts at address 0 at
reset. Program space starts at 0´400. The ISR is at the maximum address.
b. Fill the memory with the following instructions:
* 24'hA50400; // Jump to location 0´400 for the main code
* 24'h123456; // Instruction 1 located at location 0´400
* 24'h789ABC; // Instruction 2 located at location 0´401
* 24'h0F1E2D; // ISR = Return from interrupt
c. Print out the elements and the number of elements in the array.*/

module Question7 ();  // Start of module definition

    // Declare an associative array 'memory' with 24-bit wide elements, size 2^20
    logic [23:0] memory [0:2**20-1];  

    // Program Counter (PC) initialized to 0 at reset
    logic [23:0] PC = 0;

    // Program space starts at address 0x400
    localparam PROGRAM_START_ADDR = 32'h400;

    // Interrupt Service Routine (ISR) is at the maximum address (2^20 - 1)
    localparam ISR_ADDR = 32'hFFFFF;  // Max address in the address space (2^20 - 1)

    initial  // Initial block to execute at simulation start
    begin
        // Initialize memory[0] with the value 24'hA50400 and display it
        memory[0] = 24'hA50400;
        $display("memory[0] = %h", memory[0]);  // Display value at memory[0]

        // Initialize memory at PROGRAM_START_ADDR (0x400) with the value 24'h123456 and display it
        memory[PROGRAM_START_ADDR] = 24'h123456;
        $display("memory[PROGRAM_START_ADDR] = %h", memory[PROGRAM_START_ADDR]);  // Display value at memory[0x400]

        // Initialize memory at PROGRAM_START_ADDR+1 (0x401) with the value 24'h789ABC and display it
        memory[PROGRAM_START_ADDR+1] = 24'h789ABC;
        $display("memory[PROGRAM_START_ADDR+1] = %h", memory[PROGRAM_START_ADDR+1]);  // Display value at memory[0x401]

        // Display the total number of elements in the memory (2^20 elements)
        $display("Number of elements in the array: %d", 2**20);  // Display the number of elements in the array (2^20)
    end

endmodule : Question7  // End of module definition
