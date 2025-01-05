// Sample 6.17 Class to choose from an array of possible values

class Days;
	typedef enum {SUN, MON, TUE, WED,THU, FRI, SAT} days_e;

	days_e choices[$];

	rand	days_e choice;

	constraint cday {choice inside choices;}
endclass : Days



// Sample 6.18 Choosing from an array of values
module sample_6_17;

	initial begin
		Days days
		days = new();

		days.choices = {Days:: SUN, Days::: SAT};
			`SV_RAND_CHECK(days.randomize());
			$display("Random weekend day %s\n", days.choice.name());

		days.choices = {Days:: MON, Days::TUE, Days::WED, Days::THU, Days::FRI};
			`SV_RAND_CHECK(days.randomize());
			$display("Random week day %s", days.choice.name());
	end

endmodule : sample_6_17