// Sample 8.42 Configuration database with parameterized class

class config_db #(type T=int);
	T db[string];

	function void set(input string name, input T value);
		db[name] = value;
	endfunction : set

	function void get(input string name, ref T value);
		value = db[name];
	endfunction : get

	function void print();
		$display("Configuration database %s", $typename(T));
		foreach (db[i]) begin
			$display("db[$s]=%p", i, db[i]);
		end
	endfunction : print

endclass:config_db