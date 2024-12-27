// 8. Complete the following code where indicated by the comments starting with //.

program automatic test;
	import my_package::*;					// Define class Transaction
		initial
			begin
				Transaction tarray[5];		// Declaring an Array of  Transaction
				generator(tarray);			// Calling a generator task to create the objects
			end				

			task generator(ref Transaction gen_array[5]);			// Task Header
				foreach (gen_array[i]) 								// Creating objects for every handle in the array
				begin
					gen_array[i]=new();
					transmitgen_array[i];							// And transmit the object
				end
			endtask : generator

			task transmit(Transaction tr);
				////
			endtask : transmit
endprogram
	