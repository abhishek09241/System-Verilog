module Question11_design (
    input logic [1:0] opcode,  // 2-bit opcode
    input logic [1:0] A,       // 8-bit input A
    input logic [1:0] B,       // 8-bit input B
    output logic [1:0] result  // 8-bit result of the operation
);

    typedef enum logic [1:0] {
        ADD = 2'b00,  // A + B
        SUB = 2'b01,  // A - B
        INV = 2'b10,  // Bitwise NOT of A
        RED_OR = 2'b11 // Reduction OR of B
    } opcode_e;

    always_comb begin
        case (opcode)
            ADD: result = A + B;
            SUB: result = A - B;
            INV: result = ~A;
            RED_OR: result = |B;  // Reduction OR
            default: result = 2'b0;  // Default case
        endcase
    end
endmodule
