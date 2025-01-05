// Sample 7.1 Interaction of begin…end and fork…join

module sample_7_1;

	initial
		begin
			$display("@%0t: start fork....join example", $time);
		#10 $display("@%0t: sequential after #10", $time);
		
		fork
			$display("@%0t: parallel start", $time);
		#50 $display("@%0t: parallel after #50", $time);
		#10 $display("@%0t: parallel after #10", $time);


		begin
			#30 $display("@%0t: sequential after #30", $time);
			#10 $display("@%0t: sequential after #10", $time);			
		end		
		join	

		$display("@%0t: after join", $time);
		#80 $display("@%0t: finish after #80", $time);
		end
endmodule : sample_7_1



/*
@0: start fork....join example
@10: sequential after #10
@10: parallel start
@20: parallel after #10
@40: sequential after #30
@50: sequential after #10
@60: parallel after #50
@60: after join
@140: finish after #80
*/