// Sample 8.29 Simple scoreboard for atomic transactions


class Scoreboard;
	Transaction scb[$];			// Store expected tr's in queue

	function void save_expected(input Transaction tr);
		scb.push_back(tr);
	endfunction : save_expected

	function void compare_actual(input Transaction tr);
		int q[$];

		q = scb.find_index(x) with (x.src == tr.src);
		case (q.size())
			0: $display("No match found");
			1: scb.delete(q[0]);
			default :
				$display("Error, multiple matches found!");
		endcase
	endfunction: compare_actual
endclass : Scoreboard