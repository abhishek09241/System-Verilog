// Sample 4.4 Simple interface for arbiter

interface arbiter_interface (input bit clk);
    logic [1:0] grant, request; // 2-bit wide signals for grant and request
    bit rst; // Reset signal
endinterface : arbiter_interface




// Sample 4.10 Interface with modports


interface arbiter_interface (input bit clk);
		logic [1:0] grant, request;
		bit rst;

		modport TEST (output request, rst,
					  input  grant, clk);


		modport DUT (input request, rst, clk
					 output grant);

		modport MONITOR (input  request, grant, rst.clk);
endinterface : arbiter_interface
