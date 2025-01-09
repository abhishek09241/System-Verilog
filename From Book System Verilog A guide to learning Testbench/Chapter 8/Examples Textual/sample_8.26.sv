// Sample 8.26 Base callback class

virtual class Driver_cbs;		// Driver callbacks
	
	virtual task pre_tx(ref Transaction tr, ref bit drop);
		// By default, callback does nothing
	endtask : pre_tx


	virtual task port_tx(ref Transaction tr);
		// By default , callback does nothing
	endtask : port_tx
endclass:Driver_cbs