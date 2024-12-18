module testbench_ahb (interface_ahb_signal.MASTER master_intf,			// Master interface
						interface_ahb_signal.SLAVE slave_intf);			// Slave interface
	bit HCLK;				// Clock signal
	// Clock generation
	initial
		begin
			HCLK =0;
			forever #5 HCLK = ~HCLK;		// 10 ns clock period
		end
endmodule : testbench_ahb