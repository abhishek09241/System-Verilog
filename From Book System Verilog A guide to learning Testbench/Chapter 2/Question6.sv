// Given the following code, determine what will be displayed.

module Question6 ();
		string street[$];

		initial
			begin
				street = {"Tejon", "Bijou", "Boulder"};
				$display("Street[0] = %s", street[0]);    // Tejon output

				street.insert(2, "Platte");					// ("Tejon", "Bijou", "Platte", "Boulder")
				$display("Street[2] = %s", street[2]);		// Platte output

				street.push_front("St.Vrain");				// ("St.Vrain","Tejon", "Bijou", "Platte", "Boulder")
				$display("Street[2] = %s", street[2]);		// Bijou output

				$display("pop_back = %s",street.pop_back);	// Boulder output
				$display("street.size = %d",street.size);	// Size 4 output
			end



endmodule : Question6