/*4. Create a task called wait10 that for 10 tries will wait for 10ns 
and then check for 1 semaphore key to be available. When the key is 
available, quit the loop and print out the time.*/


module question_4;


	// Create a semaphore with 1 key

	semaphore sem;

	initial
	fork 
		begin
		
			sem = new(1);
			sem.get(1);
			#45ns;
			sem.put(2);
			// Call the wait10 task

		
		end
			wait10();
	join
	task wait10();
		int tries;			// Counter for 10 tries

		for (tries = 0; tries < 10; tries++) begin
		 #10ns;			// Wait for 10 ns

		 if(sem.try_get()) begin
		 	// If a semaphore key is available , exit the loop
		 	$display("%0t: Semaphore key acquired on try %0d", $time, tries+1);
		 	return;
		 end
		 else begin
		 	$display("%0t: Semaphore key is not acquired on try %0d", $time, tries+1);
		 	
		 end
		end

		// If the loop complete without acquiring the key
		$display("%0t: Failed to acquire semaphore key after 10 tries",$time);
		
	endtask : wait10

endmodule : question_4