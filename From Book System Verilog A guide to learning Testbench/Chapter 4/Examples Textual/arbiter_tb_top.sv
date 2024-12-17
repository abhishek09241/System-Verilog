// Sample 4.7 Top module with a simple arbiter interface

module arbiter_tb_top;
	bit clk;
	always #50 clk = ~clk;

	arbiter_interface     arb_intf(clk);
	arbiter_with_interface a1(arb_intf);
	arbiter_test_with_interface t1(arb_intf);

endmodule : arbiter_tb_top