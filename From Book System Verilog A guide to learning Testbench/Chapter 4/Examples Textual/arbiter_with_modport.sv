// Sample 4.11 Arbiter model with interface using modports

module arbiter_with_modport (arbiter_interface.DUT  arb_intf);
			always @(posedge arb_intf.clk or posedge arb_intf.rst)
				begin
					if(arb_intf.rst)
						arb_intf.grant <= 2'b00;
					else if (arb_intf.request[0])
						arb_intf.grant <= 2'b01;
					else if (arb_intf.request[1])
						arb_intf.grant <= 2'b10;
					else
						arb_intf.grant <= 2'b00;
				end

endmodule : arbiter_with_modport