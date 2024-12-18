/*1. Design an interface and testbench for the ARM Advanced 
High-performance Bus (AHB). You are provided a bus master 
as verification IP that can initiate AHB transactions. 
You are testing a slave design. The testbench instantiates 
the interface, slave, and master. Your interface will display 
an error if the transaction type is not IDLE or NONSEQ on 
the negative edge of HCLK.*/

interface interface_ahb_signal (input bit HCLK);
		bit [20:0] HADDR;
		bit 	   HWRITE;
		bit [1:0]  HTRANS;
		bit [7:0]  HWDATA;
		bit [7:0]  HRDATA;

	
endinterface : interface_ahb_signal