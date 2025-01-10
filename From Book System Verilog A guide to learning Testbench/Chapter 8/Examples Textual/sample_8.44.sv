// Sample 8.44 Testbench for configuration databse

class Tiny;
	int i;
endclass : Tiny

int i = 42, j=43, k;		// Integers for databse
real pi =22.0/7.0, r;		// Reals for database
Tiny t;						// Handle for database

initial
	begin
		config_db#(int)::set("i",i);		// Save int in db
		config_db#(int)::set("j",j);		// save another
		config_db#(real)::set("pi",pi);		// Save a real in db
	
		t = new();
		t.i=8;
		config_db#(Tiny)::set("t",t);		// Save a handle in db
		config_db#(Tiny)::set("null",null);	// Test null handles



		config_db#(int)::get("i",k);			// Fetch an int
		$display("Fetched value (%0d) of i (%0d)", i,k);

		config_db#(int)::print();				// Print int db
		config_db#(real)::print();				// Print real db
		config_db#(Tiny)::print();				// Print TIny db
	end