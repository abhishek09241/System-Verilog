// Sample 8.37 Dynamic print class with static variables

class Print;
	static bit [31:0] error_count = 0, error_limit = -1;
	string class_name, instance_name;

	function new(input string class_name, instance_name);
		this.class_name 	= class_name;
		this.instance_name 	= instance_name;
	endfunction : new

	function void error(input string ID, input string message);
		$display("@%0t %m [%s-%s] [%s] %s", $realtime, class_name, instance_name, ID, message);
		if(++error_count >= error_limit) begin
			$display("FATAL: Maximum error limit reached");

			$finish;
		end
	endfunction : error

endclass : Print