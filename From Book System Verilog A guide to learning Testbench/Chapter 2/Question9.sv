/*Define a user defined 7-bit type and encapsulate the fields of the following
packet in a structure using your new type. Lastly, assign the header to 7'h5A.
27header21  20cmd14 13data7  6crc0 */


module Question9 ();

		typedef logic [6:0] seven_bit;

		typedef struct {
				seven_bit header;
				seven_bit cmd;
				seven_bit data;
				seven_bit crc;
		} packet;

		packet my_packet;

		initial
			begin
				my_packet.header = 7'h5A;

				$display("my_packet.header = %h",my_packet.header);
			end


endmodule : Question9