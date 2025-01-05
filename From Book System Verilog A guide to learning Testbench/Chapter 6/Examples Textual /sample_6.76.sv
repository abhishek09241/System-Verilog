// Sample 6.76 Ethernet switch configuration class

class EthCfg;

	rand bit [3:0] 	in_use;				// Ports used in test: 3,2,1,0
	rand bit [47:0] mac_addr[4];		// MAC addresses
	rand bit [3:0] is_100;				// 100mb mode for ports 3,2,1,0
	rand uint run_for_n_frames;			// #frames in test


	// Force some addr bits when running in unicast mode
	constraint local_unicast {
		foreach (mac_addr[i])
			mac_addr[i] [41:40] == 2'b00;
	}

	constraint reasonable {			// Limit test length
		run_for_n_frames inside {[1:100]};
	}
endclass : EthCfg