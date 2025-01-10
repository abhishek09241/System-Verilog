// Sample 8.32 Parameterized class for a stack


parameter int SIZE = 100;
class Stack #(type T=int);
	local int stack[SIZE];			// Holds data values
	local int top;

	function void push(input T i);  // Push value on top
		stack[top++] = i;		
	endfunction : push

	function T pop();				// Remove values from top
		return stack [--top];
	endfunction : pop

endclass: Stack