// Sample 8.41 Configuration databse with global methods

int db_int[string];
function void db_int_set(input string name, input int value);
	db_int[name]=value;
endfunction : db_int_set

function void db_int_get(input string name, ref int value);
	value = db_int[name];
endfunction : db_int_get

function void db_int_print();
	foreach (db_int[i]) begin
		$display("db_int[%s] = %0d", i, db_int[i]);
	end
endfunction : db_int_print