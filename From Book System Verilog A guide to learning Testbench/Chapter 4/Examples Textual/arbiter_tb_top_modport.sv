// Sample 4.13 Top level module with modports

module arbiter_tb_top_modport ;
	logic [1:0] grant, request;
	bit clk;
	always #50 clk = ~clk;

	arbiter_interface     arb_intf(clk);
	arbiter_with_interface a1(arb_intf.DUT);
	arbiter_test_with_interface t1(arb_intf.TEST);

endmodule : arbiter_tb_top_modport