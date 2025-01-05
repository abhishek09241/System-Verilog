// Sample 7.7 Generator/ Driver witha run task

class Gen_drive;

	// Transactor that creates N packets

	task run(input int n);
		Packet p;

		fork
			repeat(n) begin
				p = new();
				`SV_RAND_CHECk(p.randomize());
				transmit(p);
			end
		join_none
		
	endtask : run

	task transmit(input Packet p);
	......		
	endtask : transmit

	
endclass : Gen_drive

module sample_7_7;

	Gen_drive gen;

	initial
		begin
			gen = new();
			gen.run(10);


			// Start the checker, monitor and other threads 
		end

endmodule : sample_7_7