/*Create the SystemVerilog code for the following requirements
a. Create a user-defined type, nibble, of 4 bits
b. Create a real variable, r, and initialize it to 4.33
c. Create a short int variable, i_pack
d. Create an unpacked array, k, containing 4 elements of your user defined type
nibble and initialize it to 4'h0, 4'hF, 4'hE, and 4'hD
e. Print out k
f. Stream k into i_pack right to left on a bit basis and print it out
g. Stream k into i_pack right to left on a nibble basis and print it out
h. Type convert real r into a nibble, assign it to k[0], and print out k*/

module Question10 ();

    // a. Create a user-defined type, nibble, of 4 bits
    typedef logic [3:0] nibble;  // 'nibble' is a 4-bit wide logic type

    // b. Create a real variable, r, and initialize it to 4.33
    real r = 4.33;  // Declare and initialize a real variable 'r' with value 4.33

    // c. Create a short int variable, i_pack
    shortint i_pack;  // Declare a short integer variable 'i_pack'

    // d. Create an unpacked array, k, containing 4 elements of your user-defined type nibble
    // Initialize it to 4'h0, 4'hF, 4'hE, and 4'hD
    nibble k [4];  // Declare an unpacked array 'k' of 4 nibbles

    initial
    begin
        // Initialize the array 'k' with values 4'h0, 4'hF, 4'hE, and 4'hD
        k = '{4'h0, 4'hF, 4'hE, 4'hD};  

        // e. Print out k
        // Display the values of each element in the array 'k' in hexadecimal format
        $display(" The values of K are : %h, %h, %h, %h", k[0], k[1], k[2], k[3]);

        // f. Stream k into i_pack right to left on a bit basis and print it out
        // Concatenate the elements of 'k' into 'i_pack' by streaming them bit by bit
        // The '<<' operator shifts and streams the bits into 'i_pack'
        i_pack = {<< {k}};  // Stream the elements of 'k' into 'i_pack' on a bit basis (right to left)

        // Print the value of 'i_pack' after streaming on a bit basis
        $display("i_pack on a bit basis (streamed right to left) = %h", i_pack);

        // g. Stream k into i_pack right to left on a nibble basis and print it out
        // Stream the elements of 'k' into 'i_pack' by nibble (4 bits) at a time
        i_pack = {<< 4{k}};  // Stream the elements of 'k' into 'i_pack' on a nibble basis (right to left)

        // Print the value of 'i_pack' after streaming on a nibble basis
        $display("i_pack on a nibble basis (streamed right to left) = %h", i_pack);

        // h. Type convert real r into a nibble, assign it to k[0], and print out k
        // Convert the real value 'r' to a nibble (by taking the lower 4 bits of the integer part)
        k[0] = r;  // Assign the real value 'r' to 'k[0]' (implicitly converts to a nibble)

        // Print the value of 'k[0]' after conversion
        $display("after conversion %h", k[0]);

        // Print the updated values of the entire array 'k'
        $display(" The values of K are : %h, %h, %h, %h", k[0], k[1], k[2], k[3]);
    end

endmodule : Question10
