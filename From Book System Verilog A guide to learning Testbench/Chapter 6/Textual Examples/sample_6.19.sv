// Sample 6.19 Using randc to choose array values in random order

class RandInside;
			int 		array[];				// Values to choose
	randc	bit [15:0]  index;					//	Index into array


	function new(input int a[]);			// Construct & initialize
			array = a;
	endfunction : new

	function int pick();					// Return most recent pick
		return array[index];
	endfunction : pick

	constraint c_size {index < array.size();}
endclass : RandInside

// Sample 6.20 Testbench for randc choosing array values in random order

module sample_6_19;

	initial
		begin
			RandInside ri;

			ri = new('{1,3,5,7,9,11,13});
			repeat (ri.array.size()) begin
				`SV_RAND_CHECK(ri.randomize());
				$display("Picked %2d [%0d]", ri.pick(), ri.index);
			end
		end

endmodule : sample_6_19