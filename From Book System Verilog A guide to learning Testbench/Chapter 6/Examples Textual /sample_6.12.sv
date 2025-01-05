// Sample 6.12 Random set constraint for an array

class Fib;
	rand bit [7:0] f;
		 bit [7:0] vals[] = '{1,2,3,5,8};
		 constraint c_fibonacci {
		 	f inside vals;
		 }


		 // Sample 6.13 Equivalent set of constraints

			constraint c_fibonacci {
					(f == vals[0])  || 		// f==1
					(f == vals[1])	||		// f==2
					(f == vals[2])	||		// f==3	
					(f == vals[3])	||		// f==5
					(f == vals[4]);			// f==8

			}

endclass : Fib


// Sample 6.14 Printing a histogram

module sample_6_12;

	initial
		begin
			Fib fib;
			int count[9], maxx[$];

			fib = new();

			repeat(20_000)begin
				`SV_RAND_CHECK(fib.randomize());
				count[fib.f]++;				// Count the number of hits
			end

			maxx = count.max();				// Get largest value in count


			// Print histogram of count

			foreach (count[i]) begin
				if(count[i])begin
					$write("count[%0d]=%5d",i,count[i]);
					repeat (count[i]*40/maxx[0]) $write("*");
					$display;
				end
				
			end
		end

endmodule : sample_6_12



// Sample 6.16 Histogram for inside constraint
//	count[1] = 3980 ***************************************************
//	count[2] = 3942 *************************************************
//	count[3] = 3922 **************************************************
//	count[5] = 4175 ****************************************************
//	count[8] = 3999 *************************************************
