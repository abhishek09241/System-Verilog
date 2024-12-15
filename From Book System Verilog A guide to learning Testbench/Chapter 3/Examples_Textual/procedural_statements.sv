module procedural_statements ();


	// **************** New procedural statements and operators ****************//
	initial
		begin : example
			integer array[10], sum, j;


			// Declare i in for statement

			for (int i=0; i<10; i++)
				array[i] = i;


			sum = array[9];
			j=8;
			do
				sum += array[j];
			while (j--);
			$display("Sum=%4d",sum);
		end : example


		// ************************* Using break and continue while reading a file ************************ //

		initial begin
		    bit [127:0] cmd;
		    int file, c;

		    // Use the full path to open the file
		    file = $fopen("command.txt", "r");

		    // Process the file
		    while (!$feof(file)) begin
		        c = $fscanf(file, "%s", cmd);
		        case (cmd)
		            "":       continue;
		            "done":   break;
		        endcase
		    end

		    // Close the file
		    $fclose(file);
		end




		// ******************* Passing array using ref and const ********************** //

		function automatic void print_csm11(const ref bit [31:0] a[]);
			bit [31:0] checksum =0;
			for (int i = 0; i < a.size(); i++) 
			begin
				checksum ^=a[i];

				$display("The array checksum is %h", checksum);
			end
			
		endfunction : print_csm11



		// ************************ Using ref across threads ****************** //
		
		task automatic bus_read(input logic [31:0] addr,
								ref   logic [31:0] data);


				// Request bus and drive address
				bus_request <= 1'b1;
				@(posedge bus_grant) bus_addr <= addr;


				// Wait for data from memory

				@(posedge bus_enable) data <= bus_data;


				// Release bus and wait for grant
				bus_request <= 1'b0;
				@(negedge bus_grant);
		endtask : bus_read
			
		logic [31:0] addr, data;
		
			initial
				fork
					bus_read(addr,data);
					begin : thread2
						@data;		// Trigger on data change
						$display("Read %h from bus", data);
					end
				join

				

endmodule : procedural_statements