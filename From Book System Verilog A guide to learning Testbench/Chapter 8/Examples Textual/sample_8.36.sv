// Sample 8.36 Common base class for parameterized generator class

class GenBase;
endclass: GenBase

class Generator #(type T=BaseTr) extends GenBase;
	// See Generator class in sample 8.34
endclass: Generator

GenBase gen_queue[$];
Generator #(Transaction) gen_good;
Generator #(BaseTr)		 gen_bad;


initial
	begin
		gen_good = new();					// Construct good generator
		gen_queue.push_back(gen_good);		// Save it in the queue
		gen_bad  = new();					// Construct bad generator
		gen_queue.push_back(gen_bad);		// Save it in the same queue
	end