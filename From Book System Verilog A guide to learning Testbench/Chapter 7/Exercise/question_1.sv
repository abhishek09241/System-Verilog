/*1. For the following code determine the order and time of execution for each state-
ment if a join or join_none or join_any is used. Hint: the order and time of
execution between the fork and join/join_none/join_any is the same,
only the order and execution time of the statements after the join are different.*/


module question_1;

	initial
		begin
			$display("@%0t: start fork....join example", $time);

			fork
				begin
					#20 $display("@%0t: sequential A after #20", $time);
					#20 $display("@%0t: sequential B after #20", $time);
				end
				$display("@%0t: parallel start", $time);
			#50 $display("@%0t: parallel after #50", $time);

				begin
					#30 $display("@%0t: sequential after #30", $time);
					#10 $display("@%0t: sequential after #10", $time);
				end
			join  // or join_any   or join_none
			$display("@%0t: after join", $time);
		#80 $display("@%0t: finish after #80", $time);	
		end
	

endmodule : question_1


/*

# @0: start fork....join example
# @0: parallel start
# @20: sequential A after #20
# @30: sequential after #30
# @40: sequential B after #20
# @40: sequential after #10
# @50: parallel after #50
# @50: after join
# @130: finish after #80

*/