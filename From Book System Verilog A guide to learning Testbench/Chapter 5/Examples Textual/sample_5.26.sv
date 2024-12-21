// Sample 5.26 Bad transaction creator task, missing ref on handle

// Function to create a new transaction object (BUG: Missing ref)
function void create(Transaction tr); // Handle is passed as input (default)
    tr = new();                       // Creates a new object, but updates only the local copy of tr
    tr.addr = 42;                     // Initializes the address field of the new object
    // Other fields can be initialized here
endfunction : create

module sample_5_26;
    Transaction t;                    // Declare a handle (uninitialized, null)

    initial begin
        create(t);                    // Call create function to initialize t
        $display("t.addr = %0d", t.addr); // Fails because t is still null
    end
endmodule : sample_5_26
