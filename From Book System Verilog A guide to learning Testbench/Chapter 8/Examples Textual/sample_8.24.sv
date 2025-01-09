// Sample 8.24 Abstract class with pure virtual methods

virtual class BaseTr;
	static int count;			// Number of instance created
	int id;						// Unique transaction id

	function new();
		id = count++;			// Giveeach object a unique ID
	endfunction : new



	pure virtual function bit compare (input BaseTr to);
	pure virtual function BaseTr copy(input BaseTr to = null);
	pure virtual function void display(input string prefix="");

endclass : BaseTr