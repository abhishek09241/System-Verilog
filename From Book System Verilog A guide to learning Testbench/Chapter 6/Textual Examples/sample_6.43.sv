/*When creating a testbench, you may be tempted to use the int, byte, or other
signed types for counters and other simple variables. Don’t use them in random
constraints unless you really want signed values. What values are produced when
the class in Sample 6.43 is randomized? It has two random variables and wants to
make the sum of them 64.*/


// Sample 6.43 Signed variables cause randomization problems

class SignedVars;
		rand byte pkt1_len, pkt2_len;

		constraint total_len {
			pkt1_len + pkt2_len == 64;
		}

endclass : SignedVars



/*Obviously, you could get pairs of values such as (32, 32) and (2, 62). Additionally,
you could see (−63, 127), as this is a legitimate solution of the equation, even though
it may not be what you wanted. To avoid meaningless values such as negative
lengths, use only unsigned random variables, as shown in Sample 6.44.*/


// Sample 6.44 Randomizing unsigned 32-bit variables

class Vars32;
		rand bit [31:0] pkt1_len, pkt2_len;			// Unsigned type
		constraint total_len {
			pkt1_len + pkt2_len == 64;
		}
endclass : Vars32


/*Even this version causes problems, as large values of pkt1_len and pkt2_len,
such as 32'h80000040 and 32'h80000000, wrap around when added together
and give 32'd64 or 32'h40. You might think of adding another pair of constraints
to restrict the values of these two variables, but the best approach is to make them
only as wide as needed, and to avoid using 32-bit variables in constraints. In Sample
6.45, the sum of two 8-bit variables is compared to a 9-bit value*/



// Sample 6.45 Randomizing unsigned 8-bit variables

class Vars8;
	rand bit [7:0] pkt1_len, pkt2_len;				// 8-bits wide
	constraint total_len {
		pkt1_len + pkt2_len == 9'd64;				// 9*bit sum
	}
endclass : Vars8
