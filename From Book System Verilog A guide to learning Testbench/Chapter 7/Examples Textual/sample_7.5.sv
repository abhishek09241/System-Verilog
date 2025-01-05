// Sample 7.5 Fork....join_any code


module sample_7_5;

	initial
		begin
			$display("@%0t: start fork....join_any example", $time);
		#10 $display("@%0t: sequential after #10", $time);
		fork
			$display("@%0t: parallel start", $time);
		#50 $display("@%0t: paralle after #50", $time);
		#10 $display("@%0t: paralle after #10", $time);	

		begin
			#30 $display("@%0t: sequential after #30", $time);
			#10 $display("@%0t: sequential after #10", $time);
		end
		join_any
		$display("@%0t: after join_any", $time);
		#80 $display("@%0t: finish after #80", $time);
		end

endmodule : sample_7_5



/*

# @0: start fork....join_any example
# @10: sequential after #10
# @10: parallel start
# @10: after join_any
# @20: paralle after #10
# @40: sequential after #30
# @50: sequential after #10
# @60: paralle after #50
# @90: finish after #80



*/