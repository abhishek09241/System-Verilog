// Sample 8.31 Stack using the int type

parameter int SIZE = 100;
class IntStack;
	local int stack[SIZE];			// Holds data values
	local int top;

	function void push(input int i);  // Push value on top
		stack[top++] = i;		
	endfunction : push

	function int pop();				// Remove values from top
		return stack [--top];
	endfunction : pop

endclass: IntStack