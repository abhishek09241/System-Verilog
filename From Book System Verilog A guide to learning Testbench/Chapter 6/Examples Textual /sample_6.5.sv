// Sample 6.5 Bad ordering constraint

class Order_bad;
	rand bit [7:0] lo, med, hi;
	constraint bad { lo<me<hi;}			// Gotcha!
endclass : Order_bad



// Sample 6.6 Result from incorrect ordering constraint

lo = 20 , med = 224, hi = 164
lo = 114 , med = 39, hi = 189
lo = 186 , med = 148, hi = 161
lo = 214 , med = 223, hi = 201



// Sample 6.7 Constraint variables to be ina fixed order

class Order_good;
	rand bit [7:0] lo, med, hi;
	constraint good { lo < med;				// Only use binary constraints
					   med < hi;
	}
	
endclass : Order_good