module Question11();

    // Inputs
    logic [1:0] A;
    logic [1:0] B;
    logic [1:0] opcode;

    // Output
    logic [1:0] result;

    // Instantiate the ALU
    ALU alu_inst (
        .opcode(opcode),
        .A(A),
        .B(B),
        .result(result)
    );

    // Enumerated type for opcodes
    typedef enum logic [1:0] {
        ADD = 2'b00,  // A + B
        SUB = 2'b01,  // A - B
        INV = 2'b10,  // Bitwise NOT of A
        RED_OR = 2'b11 // Reduction OR of B
    } opcode_e;

    // Variable to hold the current opcode
    opcode_e current_opcode;

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 2'b10;  // Random 8-bit value for A (0xA5)
        B = 2'b01;  // Random 8-bit value for B (0x5A)

        // Loop through all opcodes every 10ns
        for (current_opcode = ADD; current_opcode <= RED_OR; current_opcode = opcode_e'(current_opcode + 1)) begin
            opcode = current_opcode;  // Assign the current opcode to the ALU
            #10;  // Wait for 10ns


        end
         

        
    end

    // Monitor the result
    initial begin
        $monitor("Time = %0t, Opcode = %b, A = %h, B = %h, Result = %h", $time, opcode, A, B, result);
        
        #500 $finish;  // End simulation
    end

endmodule
