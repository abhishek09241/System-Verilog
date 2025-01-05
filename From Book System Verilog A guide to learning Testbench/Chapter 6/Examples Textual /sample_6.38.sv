// Sample 6.38 dist constraint with varibale weights


typedef enum {READ8, READ16, READ32} read_e;
class ReadCommands;
	rand read_e read_cmd;
	int read8_wt=1, read16_wt=1, read32_wt=1;

	constraint c_read {
			read_cmd dist {READ8 := read8_wt,
						   READ16:= read16_wt,
						   READ32:= read32_wt};
		
	}
endclass : ReadCommands




/*By default, this constraint produces each command with equal probability. If you
want to have a greater number of READ8 commands, increase the read8_wt weight
variable. Most importantly, you can turn off generation of a command by dropping
its weight to 0.*/