// Sample 5.27 Good transactions creator task with ref on handle

// Function to create a new transaction object (Correct: Uses ref)
function void create(ref Transaction tr); // Handle is passed by reference
    tr = new();                           // Creates a new object and updates the original handle
    tr.addr = 42;                         // Initializes the address field of the new object
    // Other fields can be initialized here
endfunction : create

module sample_5_27;
    Transaction t;                        // Declare a handle (uninitialized, null)

    initial begin
        create(t);                        // Call create function to initialize t
        $display("t.addr = %0d", t.addr); // Works because t now points to the new object
    end
endmodule : sample_5_27
