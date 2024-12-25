// 8. Complete the following code where indicated by the comments starting with //.

program automatic test;
	import my_package::*;
		initial
			begin
				Transaction tarray[5];
				generator(tarray);									
			end				

			task generator(ref Transaction gen_array[5]);
				foreach (gen_array[i]) 
				begin
					gen_array[i]=new();
					transmitgen_array[i];	
				end
			endtask : generator
	