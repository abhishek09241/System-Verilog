// Sample 6.1  Simple random class

class Packet;
	 // The random variables

	 rand bit [31:0] src;
	 rand bit [31:0] dst;
	 rand bit [31:0] data[8];
	 randc bit [7:0] kind;




	 // Limit the values for src

	 constraint c { src > 10;
	 				src < 15;}	
endclass : Packet


module sample_6_1;
	Packet p;
	 initial
	 	begin
	 		p = new();				// Create a packet
	 		if (!p.randomize())
	 				$finish;
	 		transmit (p);
	 	end

endmodule : sample_6_1