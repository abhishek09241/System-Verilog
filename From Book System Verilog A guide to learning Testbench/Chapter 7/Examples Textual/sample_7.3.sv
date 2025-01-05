// Sample 7.3 Fork......join_none code

module sample_7_3;

	initial
		begin
			$display("@%0t: start  fork.....join_none example", $time);
			#10 $display("@%0t: sequential after #10", $time);

			fork
				$display("@%0t: parallel start", $time);
			#50 $display("@%0t: parallel after #50", $time);
			#10 $display("@%0t: paralle after #10", $time);

			begin
				#30 $display("@%0t: sequential after #30", $time);
				#10 $display("@%0t: sequential after #10", $time);
			end
			join_none
			$display("@%0t: after join_none", $time);
			#80 $display("@%0t: finish after #80", $time);
		end
	

endmodule : sample_7_3



/*
# @0: start  fork.....join_none example
# @10: sequential after #10
# @10: after join_none
# @10: parallel start
# @20: paralle after #10
# @40: sequential after #30
# @50: sequential after #10
# @60: parallel after #50
# @90: finish after #80
*/