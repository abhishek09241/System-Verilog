/*7. Look at Fig. 7.8 “Layered testbench with environment” on page 265 and create
the Monitor class. You can make the following assumptions.
a. The Monitor class has knowledge of class OutputTrans with member vari-
ables out1 and out2.
b. The DUT and Monitor are connected with an interface called my_bus, with
signals out1 and out2.
c. The interface my_bus has a clocking block, cb.
d. On every active clock edge, the Monitor class will sample the DUT outputs,
out1 and out2, assign them to an object of type OutputTrans, and place
the object in a mailbox.*/



class OutputTrans;
	// Member variables to hold the sampled values

	bit out1;
	bit out2;

	function new();
		out1 = 0;
		out2 = 0;
	endfunction : new


	// Method to set the values

	function void set_values(bit o1, bit o2);
		out1 = o1;
		out2 = o2;
	endfunction : set_values
endclass: OutputTrans


interface my_bus(input logic clk);
	logic out1;
	logic out2;


	// Clocking block to sample the signals on the active clock edge

	clocking cb @(posedge clk);
		output out1, out2; // Sampling the output signals
endinterface : my_bus


class Monitor;

	// Mailbox to store the sampled OutputTrans Objects

	mailbox #(OutputTrans) output_mailbox;


	// Constructor to initialize the mailbox

	function new();
		output_mailbox = new();
	endfunction : new

	// Method to sample the DUT outputs and place the objects in the mailbox

	function void sample(my_bus bus);
		OutputTrans trans;

		// Sample the signals at the active clock edge
		@(bus.cb);		//Wait for the clocking block to trigger


		// Create a new OutputTrans object and set the sampled values
		trans = new();
		trans.set_values(bus.out1, bus.out2);

		// Place the object in the mailbox
		output_mailbox.put(trans);

	endfunction : sample	
endclass : Monitor