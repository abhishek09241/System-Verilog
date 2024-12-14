module logic_data_type (input logic rst_h);
	parameter cycle =20;
	logic q, q_1, d, clk, rst_1;

	initial
		begin
			clk=0;							// Procedural assignment
			forever #(cycle/2) clk = ~clk;
		end

		assign rst_1 = ~rst_h;		// Continuous assignment
		not n1(q_1,q);				// q_1 is driven by gate
		my_dff d1(q,d,clk,rst_1);	//q is driven by module



		// **********Initializing an array***********//

		initial
			begin
				static int ascend[4] = '{0,1,2,3};   // Initialize 4 elements
				int descend[5];

				descend = '{4,3,2,1,0};    // Set 5 elements
				descend[0:2] = '{7,6,5};   // Set just first 3 elements
				ascend = '{4{8}};			// Four values of 8
				ascend = '{default:42};		// All elements are set to 42
			end


		// ************** Printing with %p print specifier ********** //

		initial
			begin
				ascend = '{0,1,2,3};   
				$display("%p",ascend);				//'{0,1,2,3}
				ascend = '{4{8}};				
				$display("%p",ascend);				//'{8,8,8,8}
			end


		// *************** Using arrays with for and foreach loops ************* //

		initial
			begin
				bit [31:0] src[5], dst[5];
				for (int i = 0; i < $size(src); i++) 
					begin
						src[i] = i;				// Initialize src array
					end		
				foreach (dst[j]) 
					begin
						dst[j] = src[j]*2;      // Set dst array to 2*src
					end
			end	



		// ************** Initialize and step through a multi-dimensional array ************************* //

		int md[2][3] = '{'{0,1,2}, '{3,4,5}};

		initial
			begin
				$display("initial value");
					foreach (md[i,j])				// This is the right synatx
					begin
						$display("md[%0d][%0d]=%0d", i,j,md[i][j]);
					end


				$display("new value");
				// replicate last 3 values of 5

				md = '{'{9,8,7}, '{3{5}}};
					foreach (md[i,j])				// This is the right synatx
					begin
						$display("md[%0d][%0d]=%0d", i,j,md[i][j]);
					end
			end



		// ***************** Array copy and compare operations *********** //

		initial
			begin
				bit [31:0] src[5] = '{0,1,2,3,4},
						   dst[5] = '{5,4,3,2,1};


						   // Aggregrate compare the two arrays

						   if (src==dst) 
							   begin
							   		$display("src==dst");
							   end
							else
								begin
									$display("src != dst");   	
								end

							// Aggregrate copy all arc values to dst
							dst = src;


							// Change just one element
							src[0] = 5;

							// Are all values equal (n0!)

							$display("src %s dst", (src==dst)? "==": "!=");


							// Use array slice to compare elements 1-4 (they are equal)
							$display("src[1:4] %s dst[1:4]",(src[1:4] == dst[1:4]) ? "==" : "!=");
			end



			// ********** Using dynamic arrays ************** //

			int dyn[], d2[];				// Declare dynamic arrays by empty brackets[]


				initial
					begin
						dyn=new[5];							// A: Allocate 5 elements
						foreach (dyn[j]) dyn[j] = j;		// B: Initialize the elements
							begin
								d2 = dyn;					// C: Copy a dynamic array
								d2[0] = 5;					// D: Modify the copy
								$display("dyn[0],d2[0]");	// E: See both values (0 & 5)
								dyn = new[20](dyn);			// F: Allocate 20 ints & copy
								dyn = new[100];				// G: Allocate 100 new ints
															//    Old value are lost
								dyn.delete();				// H: Delete all elements
							end
					end



			// **** Multi - dimensional dynamic array ******* //

			// A dynamic array of dynamic arrays

			int d[] [];

			initial
				begin
					//Construct the first or left-most dimension

					d=new[4];

					// Construct the 2nd dimension, each array a different size
					foreach (d[j])
						begin
							d[i] = new[i+1];
						end

					// initialize the elements. d[4][2]=42;

					foreach (d[i,j]) 
						begin
							d[i] [j] = i*10+j;
						end

				end


			// ************** Queue Methods ***************** //

			int j=1;

					q2[$] = {3,4},   				// Queue literals do not use '
					q[$]  = {0,2,3};				// {0,2,3}

			initial
				begin
					q.insert(1,j);					// {0,1,2,3}  	Insert j at index 1
					q.delete(1);					// {0,2,3}    	Delete element at index 1


					// These operations are fast

					q.push_front(6);				//{6,0,2,3} 	Insert at front
					j=q.pop_back;					// {6,0,2}  	j=3
					q.push_back(8);					// {6,0,2,8}	Insert at back
					j=q.pop+front;					// {0,2,8}		j=6
					foreach (q[i]) 
						begin
							$display("q[i]");		// 				Print enitre queue
						q.delete();					//{}			Delete queue
						end
				end


			// ************ Queue OPerations ************ //

			int j = 1,

				q2[$] = {3,4},						// Queue literals do not use '
				q[$]  = {0,2,5};					// {0,2,5}

				initial
					begin
						q = {q[0], j, q[1:$]};		// {0,1,2,5} 		 Insert 1 before 2
						q = {q[0:2], q2, q[3:$]};	//  {0,1,2,3,4,5}	 Insert queue in q
						q = {q[0], q[2:$]};			// {0,2,3,4,5}       Delete elem. #1

						// These operations are fast

						q = {6,q};					// {6,0,2,3,4,5} 	Insert at front

						j = q[$];					// j = 5			pop_back
						q = q[0:$-1];				// {6,0,2,3,4}		equivalent

						q = {q,8};					// {6,0,2,3,4,8}    Insertt at back

						j = q[0];					// j=6				pop_front
						q = q[1:$];					// {0,2,3,4,8}		equivalent

						q = {};						// {}				Delete conetnts
					end


			// **************** Declaring, initializing and using associative arrays ****************************** //

			
			byte assoc[byte], idx = 1;

				initial
					begin
						// Initialize widely scattered values

						do
							begin
								assoc [idx] = idx;
								idx = idx<<1;        // idx ko left shift karo (e.g., 1, 2, 4, 8, ...)
							end
						while (idx != 0);

						// Step through all index values with foreach

						foreach (assoc[i])
							begin
								$display("assoc[%h] = %h",i,assoc[i]);
							end

						// step through all index values with functions

						if (assoc.first(idx))	// Get first index
							do
								$display("assoc[%h]=%h",idx,assoc[idx]);
							while (assoc.next(idx));		// Get next idex
						
						// Find and delete the first element

						void' (assoc.first(idx));
						void' (assoc.delete(idx));
						$display("The array now has %0d elements", assoc.num());			
					end			


			// ******* User-defined type in System Verilog ********* //

			parameter OPSIZE = 8;  
			// Defines a parameter `OPSIZE` with a value of 8, which specifies the size of the `opreg_t` type.

			typedef logic [OPSIZE-1:0] opreg_t;  
			// Creates a type alias `opreg_t` for an 8-bit wide `logic` vector (determined by `OPSIZE`).

			opreg_t op_a, op_b;  
			// Declares two variables, `op_a` and `op_b`, of type `opreg_t` (8-bit wide logic vectors).


			// ******* User defined array type ************* //

			typedef int fixed_array5_t[5];
			fixed_array5_t f5;					// Equivalent to "int f5[5]"


			initial
				begin
					foreach (f5[i])
						f5[i] = i;
				end


			// ********* Initializing a struct ****************** //
			
			initial
				begin
					typedef struct {

						int a;
						byte b;
						shortint c;
						int d;
					} my_struct_s;

				my_struct_s st= '{32'haaaa_aaaa,
								  8'hbb,
								  16'hcccc,
								  32'hdddd_dddd};
					$display("str = %x %x %x %x", st.a, st.b, st.c, st.d);		
				end	

				// ********** Using typedef to create a union ********** //

				typedef union {bit [31:0] b; int i;} num_u;  
				// Defines a union type `num_u` that can store either a 32-bit unsigned bit vector `b` 
				// or a signed integer `i`. Both fields share the same memory location.

				num_u un;  
				// Declares a variable `un` of type `num_u`.

				un.i = -i;  
				// Assigns a signed integer value `-i` to the `i` field of the union `un`.
				// This overwrites the memory shared with the `b` field.

endmodule : logic_data_type