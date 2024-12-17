//Sample 4.12 Testbench with interface using modports
module arbiter_test_with_modport (arbiter_interface.TEST  arb_intf);

		initial
			begin
				@(posedge  arb_intf.clk);
				arb_intf.request <= 2'b01;
				$display("@%0t: Drove req=01", $time);

				repeat (2) @(posedge arb_intf.clk);
				if (arbiter_interface.grant != 2'b01) 
					begin
					 	$display("@%0t: Error: grant != 2'b01", $time);

					 $finish;		
					end 
			end

endmodule : arbiter_test_with_modport