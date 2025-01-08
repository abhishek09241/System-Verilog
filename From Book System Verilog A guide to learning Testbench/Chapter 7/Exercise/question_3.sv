/*3. What would be displayed with the following code? 
Assume that the events and task trigger is declared inside a program 
declared as automatic.*/

program automatic question_3;

	event e1, e2;
	task trigger(event local_event, input time wait_time);
		#wait_time;
		->local_event;
	endtask : trigger


	initial
		begin
			fork
				trigger(e1, 10ns);
				begin
					wait (e1.triggered());
					$display("%0t: e1 triggered", $time);
				end
			join
		end


	initial
		begin
			fork
				trigger(e2, 20ns);
				begin
					wait(e2.triggered());
					$display("%0t: e2 triggered", $time);
				end
			join
		end
endprogram