/*Declare a 5 by 31 multi-dimensional packed array, my_array2. Each element of
the packed array holds a 2-state value.
a. Which of the following assignment statements are legal and not out of bounds?
* my_array2[4][30] = 1'b1;
* my_array2[29][4] = 1'b1;
* my_array2[3] = 32'b1;
b. Draw my_array2 after the assignment statements complete.*/

module Question5 ();

	// Declare a multi-dimensional array of 5 rows and 31 columns
    // Each element in the array is a 1-bit value (bit [4:0] [30:0] means 5 rows and 31 columns)

    bit [4:0] [30:0] my_array2;
	bit [4:0] [30:0] my_array2;

	initial
		begin
			// Legal assignment: Set bit 30 of row 4 to 1
			my_array2[4][30]	= 1'b1;		// Legal

	        // Illegal assignment: Attempt to access row 29, which is out of bounds (only rows 0 to 4 are valid)
			my_array2[29][4]	= 1'b1;		// Outof Bound
	
	        // Legal assignment: Set the entire row 3 to 32'b1 (all bits in row 3 are set to 1)		
			my_array2[3]		= 32'b1;	// Legal


			$display("my_array2[4][30] = %h",my_array2[4][30]);
			$display("my_array2[29][4] = %h",my_array2[29][4]);
			$display("my_array2[3]	   = %h",my_array2[3]);

			// Display the array in a readable format

			for (int i = 0; i < 5; i++) 
				begin
					for (int j = 0; j < 31; j++) 
						begin
							$write("%b", my_array2[i][j]);
						end
					$write("\n");
				end
		end

endmodule : Question5