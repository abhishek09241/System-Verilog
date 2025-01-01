// Sample 6.34 The randomize () with statement

class Transaction;
	rand bit [31:0] addr, data;
	constraint c1 {addr inside {[0:100], [1000:2000]};}
endclass : Transaction

module sample_6_34;

	Transaction t;

		initial
			begin
				t = new();

				// addr is 50-100, 1000-1500, data<10
				`SV_RAND_CHECK(t.randomize() with {addr >= 50; addr <= 1500;
												    data <10; });

				driveBus(t);

				// force addr to a specific value, data > 10

				`SV_RAND_CHECK(t.randomize() with {addr == 2000; data > 10;});

				driveBus(t);
			end

endmodule : sample_6_34