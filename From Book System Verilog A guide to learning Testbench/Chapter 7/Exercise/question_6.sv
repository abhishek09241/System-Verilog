/*6. What would be displayed with the following code??*/

program automatic test;
	mailbox #(int) mbx;
	int value;

	initial
	begin
		mbx = new(1);
		$display("mbx.num()=%0d",mbx.num());
		$display("mbx.try_get=%0d", mbx.try_get(value));
		mbx.put(2);
		$display("mbx.try_put =%0d", mbx.try_put(value));
		$display("mbx.num()=%0d", mbx.num());
		mbx.peek(value);
		$display("value = %0d", value);
	end
endprogram


/*
mbx.num()=0
mbx.try_get=0
mbx.try_put=0
mbx.num()=1
value = 2


*/