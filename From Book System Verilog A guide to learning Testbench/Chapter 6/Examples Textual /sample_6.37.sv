// Sample 6.37 Constraint with a variable bound

class Packet;
	rand bit [31:0] length;
		 bit [31:0] max_length = 100;		// Configuration, not rand
		 constraint c_length {
		 		length inside {[1:max_length]};
		 }
endclass : Packet


/*By default, this class creates random lengths between 1 and 100, but by changing
the variable max_length, you can vary the upper limit.*/