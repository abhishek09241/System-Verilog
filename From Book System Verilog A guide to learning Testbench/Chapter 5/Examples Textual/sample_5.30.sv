// Sample 5.30 Using an array of handles

task generator();
    // Declare an array of handles (size 10) to store Transaction objects
    Transaction tarray[10];  // Array of handles, initially all elements are null

    // Loop through each index of the array
    foreach (tarray[i]) begin
        tarray[i] = new();  // Create a new Transaction object for each handle
        transmit(tarray[i]);  // Pass the object to the transmit task
    end
endtask: generator
