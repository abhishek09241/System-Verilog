// Sample 8.17 Building an Ethernet frame with composition

// Not recommended

class EthMacFrame;
	typedef enum {II, IEEE} kind_e;
	rand kind_e 		kind;
	rand bit 	[47:0]  da, sa;
	rand bit 	[15:0]  len;



	/////
	rand Vlan vlan_h;
endclass: EthMacFrame


class Vlan;
	rand bit [15:0] vlan;
endclass