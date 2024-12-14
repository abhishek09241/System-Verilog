module Question3 ();

		// Declare a 2-state array with 4 elements, each 12 bits wide
		bit [11:0] my_array[4];
	

		initial
			begin
				// Initialize the array with the specified values
				my_array = '{12'h012, 12'h345, 12'h678, 12'h9AB};


				 // Display the initialized array values
				foreach (my_array[i])
					begin
						$display("my_array[%0d] = %h",i, my_array[i]);	
					end

				// Traverse with a for loop
					
				$display("Using for loop:");

				for (int i=0; i<4; i++)
					begin
						$display("my_array[%0d][5:4]=%b",i, my_array[i][5:4]);
					end

				// Traverse with a foreach loop

				$display("Using foreach loop:");

				foreach (my_array[i]) 
					begin
						$display("my_array[%0d][5:4]=%b",i,my_array[i][5:4]);
					end

			end


endmodule : Question3