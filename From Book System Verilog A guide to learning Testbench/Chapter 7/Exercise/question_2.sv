/*For the following code what would the output be with and without 
a wait fork inserted in the indicated location.*/

module question_2;

	initial
		begin
			fork
				transmit(1);
				transmit(2);
			join_none



			fork : receive_fork
				receive(1);
				receive(2);
			join_none


			// What is the output with/without a wait fork here?
			//wait fork;


			#15ns disable receive_fork;
			$display("%0t: Done", $time);
		end

		task transmit(int index);
			#10ns;
			$display("%0t: Transmit is done for index = %0d", $time, index);
		endtask : transmit

		task receive(int index);
			#(index *10ns);
			$display("%0t: Receive is done for index = %0d", $time, index);
		endtask : receive
endmodule : question_2


/*
with wait fork

# 10: Receive is done for index = 2
# 10: Transmit is done for index = 2
# 10: Transmit is done for index = 2
# 20: Receive is done for index = 2
# 35: Done
*/



/*
without wait fork
# 10: Receive is done for index = 2
# 10: Transmit is done for index = 2
# 10: Transmit is done for index = 2
# 15: Done


*/