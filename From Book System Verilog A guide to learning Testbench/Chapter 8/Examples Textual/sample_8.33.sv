// Sample 8.33 Creating the parameterized stack class

initial
	begin
		Stack #(real) rStack;			// Specialize the stack class

		rStack = new();					// Construct a stack of reals
		for(int i=0; i<SIZE; i++)
			rStack.push(i*2.0);			// Push values onto stack

		for (int i = 0; i < SIZE; i++) begin
			$display("%f",rStack.pop());		// Pop values off stack
		end
	end