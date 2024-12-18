module arbiter_test_with_clocking_block (arbiter_interface_with_clocking_block.TEST arb_intf);

	initial
		begin
			@arb_intf.cb;
			arb_intf.cb.request <= 2'b01;
			@arb_intf.cb;
			$display("@%0t: Grant = %b", %time, arb_intf.cb.grant);
			@arb_intf.cb;
			$display("@%0t: Grant = %b", $time, arb_intf.cb.grant);
			$finish;
		end

endmodule : arbiter_test_with_clocking_block