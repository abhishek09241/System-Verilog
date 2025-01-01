//Sample 6.3 Constraint without random variables

class Child;
	bit [7:0] age;			// Error -should ne rand or randc
	constraint c_teenager { age > 12;
							age < 20;}
endclass : Child