// Sample 8.43 Configuration databse with static parametrized class

class config_db #(type T=int);
	static T db[string];

	static function void set(input string name, input T value);
		db[name] = value;
	endfunction : set

	static function void get(input string name, ref T value);
		value = db[name];
	endfunction : get

	static function void print();
		$display("Configuration database %s", $typename(T));
		foreach (db[i]) begin
			$display("db[$s]=%p", i, db[i]);
		end
	endfunction : print

endclass:config_db