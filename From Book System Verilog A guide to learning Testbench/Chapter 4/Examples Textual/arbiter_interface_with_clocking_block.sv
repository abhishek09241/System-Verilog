// Sample 4.16  Interface with a clocking block


interface arbiter_interface_with_clocking_block (input clk);
			logic [1:0] grant, request;
			bit rst;


			clocking cb @(posedge clk);				// Declare cb

				output request;
				input grant;
			endclocking



			modport TEST (clocking cb,				//Use cb
						  output rst);

			modport DUT (input request, rst, clk,
						 output grant);
	
endinterface : arbiter_interface_with_clocking_block
