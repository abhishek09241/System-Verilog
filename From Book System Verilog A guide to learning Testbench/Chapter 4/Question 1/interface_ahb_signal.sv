/*1. Design an interface and testbench for the ARM Advanced 
High-performance Bus (AHB). You are provided a bus master 
as verification IP that can initiate AHB transactions. 
You are testing a slave design. The testbench instantiates 
the interface, slave, and master. Your interface will display 
an error if the transaction type is not IDLE or NONSEQ on 
the negative edge of HCLK.*/

interface interface_ahb_signal (input bit HCLK);

	// Signal Declarations

		bit [20:0] HADDR;
		bit 	   HWRITE;
		bit [1:0]  HTRANS;
		bit [7:0]  HWDATA;
		bit [7:0]  HRDATA;



		// Clocking BLock
		clocking cb @(posedge HCLK);
			output HADDR, HTRANS,HWDATA,HWRITE;			// Data driven by master
			input HRDATA;								// Data Ready By Master
		endclocking



		// Modports

		modport MASTER (clocking cb, output HADDR, HWRITE, HTRANS, HWDATA,HCLK,
						input HRDATA);

		modport SLAVE (clocking cb, input HADDR, HWRITE, HTRANS, HWDATA, HCLK,
					   output HRDATA);


	
	// Always block for error detection	
	always @(negedge HCLK)
		begin
			if (HTRANS != 2'b00 && HTRANS != 2'b01)
					begin
						$error("Invalid Transaction type detected: %b", HTRANS);
					end
			end
endinterface : interface_ahb_signal