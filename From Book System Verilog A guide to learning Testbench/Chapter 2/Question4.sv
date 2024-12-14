/*Declare a 5 by 31 multi-dimensional unpacked array, my_array1. Each element
of the unpacked array holds a 4-state value.
a. Which of the following assignment statements are legal and not out of bounds?
* my_array1[4][30] = 1'b1;
* my_array1[29][4] = 1'b1;
* my_array1[4] = 32'b1;
b. Draw my_array1 after the legal assignments complete.*/


module Question4 ();
	logic  my_array1[5][31];

	initial
		begin
			my_array1[4][30] = 1'b1; // Legal
			my_array1[29][4] = 1'b1; // Out of bounds
			//my_array1[4]	 = 32'b1; // Illegal

			$display("my_array1[4][30] = %h",my_array1[4][30]);
			$display("my_array1[29][4] = %h",my_array1[29][4]);
			//$display("my_array1[4] = %h",my_array1[4]);


			// Display the array in a readable format

			for (int i = 0; i < 5; i++) 
				begin
					for (int j = 0; j < 31; j++) 
						begin
							$write("%b", my_array1[i][j]);
						end
					$write("\n");
				end

		end
endmodule : Question4