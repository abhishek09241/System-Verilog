// Complete Table below for the following constrains

class MemTrans;
	rand bit x;
	rand bit [1:0] y;
	constraint c_xy {
		y inside {[x:3]};
		solve x before y;
		}
endclass



// Solution	x  y	Probabilty
// A		0  0	1/2*1/4=1/8
// B		0  1 	1/2*1/4=1/8
// C		0  2	1/2*1/4=1/8
// D		0  3	1/2*1/4=1/8
// E		1  0	1/2*0=0
// F		1  1	1/2*1/3=1/6
// G		1  0	1/2*1/3=1/6
// H		1  3	1/2*1/3=1/6
