// Sample 6.14 Choose any value except those in an array	

class NotFib;
	rand bit [7:0] notf;
		 bit [7:0] vals[] = '{1,2,3,5,8};
		 constraint c_fibonacci {
		 		!(notf inside vals);
		 }
endclass : NotFib