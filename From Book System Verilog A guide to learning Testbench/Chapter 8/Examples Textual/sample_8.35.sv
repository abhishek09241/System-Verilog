// Sample 8.35 Simple testbench using parameterized generator class

program automatic test;

	initial
		begin
			Generator #(Transaction) gen;
			mailbox   #(Transaction) gen2driv;
			gen2driv = new(1);
			gen 	 = new(gen2driv);

			fork
				gen.run();

				repeat (5) begin
					Transaction tr;
					gen2driv.peek(tr);		// Get next transaction
					tr.display();
					gen2driv.get(tr);		// Remove transaction
				end
			join_any
		end
endprogram