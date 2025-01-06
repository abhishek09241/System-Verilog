// Sample 7.9 Bad fork......join_none inside a loop


program no_auto;
	initial begin
		for(int j=0; j<3; j++)
			fork
				$write(j);				// Bug- prints final value of index
			join_none
		#0 $display;
	end
endprogram