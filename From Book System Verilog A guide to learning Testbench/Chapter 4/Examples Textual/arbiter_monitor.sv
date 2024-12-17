// Arbiter monitor with interface using modports

module arbiter_monitor (arbiter_interface.MONITOR arb_intf);

		always @(posedge arb_intf.request[0])
			begin
				$display("@%0t: request[0] asserted", $time);
				@(posedge arb_intf.grant[0]);
				$display("@%0t: grant[0] asserted", $time);
			end

		
		always @(posedge arb_intf.request[1])
			begin
				$display("@%0t: request[1] asserted", $time);
				@(posedge arb_intf.grant[1]);
				$display("@%0t: grant[1] asserted", $time);
			end	


endmodule : arbiter_monitor