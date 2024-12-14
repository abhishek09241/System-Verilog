//************* Given the following code sample ***************** //
module Question2 ();
    // Declare the arrays and variables
    bit    [7:0]  my_mem[3];          // Array of 3 elements, each 8 bits wide
    logic  [3:0]  my_logicmem[4];     // Array of 4 elements, each 4 bits wide
    logic  [3:0]  my_logic;           // Single 4-bit variable
		
		initial 
			begin
		        // Initialize arrays and variables
		        my_mem       = '{default: 8'hA5};   // Initialize all elements to 8'hA5
		        my_logicmem  = '{0, 1, 2, 3}; // Initialize with values 0, 1, 2, 3
		        my_logic     = 4'hF;                // Initialize to 4'hF


				// *********** Evaluate the following statements in the given order and give the result for each assignment ***************//

				// +++++++++ a. my_mem[2] = my_logicmem[4]; +++++++++++ //

					my_mem[2] = my_logicmem[4];				// Assign the 5th Element of my_logicmem
					$display("my_mem[2] = %h",my_mem[2]);	// Print the result
				

				// // Optional : Handle out of bounds access with a check

				// if(4<$size(my_logicmem))
				// 	begin
				// 		my_mem[2]=my_logicmem[4];   // This wont execute because its out of bounds
				// 	end
				// else
				// 	begin
				// 		$display("Error: Index out of bounds for my_logicmem[4]");
				// 	end


				// +++++++++++++ b. my_logic = my_logicmen[4]; ++++++++++++ //	

					my_logic = my_logicmem[4];				// Assigning the 5 the element of my_logicmem
					$display("my_logic = %h",my_logic);	// Print the result


				// +++++++++++++ c. my_logicmem[3] = my_mem[3]; +++++++++++++++

					my_logicmem[3] = my_mem[3];							// Assigning the 4 element of my_mem
					$display("my_logicmem[3] = %h", my_logicmem[3]);	// Print the result


				// ++++++++++++++ d. my_mem[3] = my_logic;   ++++++++++++++ //

					my_mem[2] = my_logic;
					$display("my_mem[2]=%h",my_mem[2]); 

				// +++++++++++++++++ e. my_logic = my_logicmem[1];  +++++++++++++++++++ //

					my_logic = my_logicmem[1];
					$display("my_logic = %h",my_logic);

				// ++++++++++++++++++++ f. my_logic = my_mem[1]; +++++++++++++++++++++++ // 

					my_logic = my_mem[1];
					$display("my_logic = %h",my_logic);

				// ++++++++++++++++++++++++++ g. my_logic = my_logicmem [my_logicmem[41]; ++++++++++++++++++++++++++ //
					
					my_logic = my_logicmem[my_logicmem[41]];
					$display("my_logic = %h", my_logic);	
			end
endmodule : Question2