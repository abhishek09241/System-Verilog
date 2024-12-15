/*Create the SystemVerilog code for the following requirements
a. Create a 3-byte queue and initialize it with 2, −1, and 127
b. Print out the sum of the queue in the decimal radix
c. Print out the min and max values in the queue
d. Sort all values in the queue and print out the resulting queue
e. Print out the index of any negative values in the queue
f. Print out the positive values in the queue
g. Reverse sort all values in the queue and print out the resulting queue*/
module Question8 ();
	
		byte queue [3]={8'd2, -1, 8'd127};
		byte tqueue[$];						// Temporary queue
		int sum;
		byte min_values;
		byte max_values;

		initial
			begin

				// a. Create a 3-byte queue and initialize it with 2, −1, and 127

				queue[0] = 8'd2;
				$display("queue[0]=%d",queue[0]);

				queue[1] = -1;
				$display("queue[1]=%d",queue[1]);
				
				queue[2] = 8'd127;		
				$display("queue[2]=%d",queue[2]);

				// b. Print out the sum of the queue in the decimal radix
				sum = queue[0] + queue[1] + queue[2];
				$display("The sum of the queue in the decimal radix: %d",sum);


				// c. Print out the min and max values in the queue
				min_values = queue[0];
				foreach (queue[i]) 
					begin
						if(queue[i]<min_values)
							begin
								min_values=queue[i];
							end
					end
				$display("Minimum value in the queue: %d", min_values);


				max_values = queue[0];
				foreach (queue[i]) 
					begin
						if (queue[i]>max_values) 
							begin
								max_values =queue[i];
							end	
					end
				$display("Maximum value in the queue: %d", max_values);

				// By method unpacked array is displaye by %p format
				tqueue = queue.min();
				$display("Minimum = %p",tqueue);

				tqueue = queue.max();
				$display("Maximum = %p",tqueue);


				// d. Sort all values in the queue and print out the resulting queue

				// Display the queue before sorting

				$display("Before Sorting:");
				foreach (queue[i]) 
					begin
						$display("queue[%0d]=%d",i,queue[i]);
					end

				// Sort the queue in ascending order
				queue.sort();
				

				// Display the queue after sorting
				$display("After sorting:");
				foreach (queue[i]) 
					begin
						$display("queue[%0d]=%d",i,queue[i]);
					end

				// e. Print out the index of any negative values in the queue	
				
				$display("Indices of negative values: -1");
				foreach (queue[i]) 
					begin
						if (queue[i]<0)
							begin
								$display("is %0d",i);
							end
					end


				// 	f. Print out the positive values in the queue

				$display("The Positive values in the queue: ");
				foreach (queue[i]) 
					begin
						if (queue[i]>0) 
							begin
								$display("Positive values in the queue %0d: %d", i, queue[i]);
							end
					end

				// g. Reverse sort all values in the queue and print out the resulting queue

				$display("Before Sorting:");
				foreach (queue[i]) 
					begin
						$display("queue[%0d]=%d",i,queue[i]);
					end

				// Sort the queue in ascending order
				queue.rsort();
				

				// Display the queue after sorting
				$display("After sorting:");
				foreach (queue[i]) 
					begin
						$display("queue[%0d]=%d",i,queue[i]);
					end	

			end

endmodule : Question8