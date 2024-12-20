// Sample 5.22 Statistics class declaration

class Statistics;
	time startT;							// Transaction start time
	static int ntrans = 0;					// transaction count
	static time total_elapsed_time = 0;


	function void start();
		startT	= $time;		
	endfunction : start

	function void stop();
			time how_long = $time - startT;
			ntrans++;							//Another trans completed
			total_elapsed_time += how_long;		
	endfunction : stop
endclass : Statistics