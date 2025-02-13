/*4. Starting with the solution to Exercise 3, use the Exercise3 class to randomize val1 and val2, and print out the multiplied value.*/

class Binary;
	rand bit [3:0] val1, val2;

	function new(input bit [3:0] val1, val2);
		this.val1 = val1;
		this.val2 = val2;
	endfunction : new

	virtual function void print_int(input int val);
		$display("val=0d%0d",val);
	endfunction : print_int
endclass : Binary

class Exercise3 extends Binary;
	function new();
		super.new(val1,val2);
	endfunction : new

	function int multiplies();
		multiplies = val1*val2;		
	endfunction : multiplies

	constraint exercise_c {
		val1<10;
		val2<10;
	}
endclass : Exercise3

module question_4;

	Exercise3 ex3;

	initial begin
	ex3 = new();
	assert(ex3.randomize())else $fatal("Randomization failed!");
	ex3.print_int(ex3.multiplies());

end
endmodule : question_4