/*1. Write the SystemVerilog code for the following items.
a. Create a class Exercise1 containing two random variables, 8-bit data and
4-bit address. Create a constraint block that keeps address to 3 or 4.
b. In an initial block, construct an Exercise1 object and randomize it.
Check the status from randomization.*/


class Exercise1;

		rand bit [7:0] data;
		rand bit [3:0] address;

		constraint c_address {
				address inside {[3:4]};	}
endclass : Exercise1