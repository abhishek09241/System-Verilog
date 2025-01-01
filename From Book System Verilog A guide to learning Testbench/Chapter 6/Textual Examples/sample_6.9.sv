// Sample 6.9 Dynamically changing distribution weights

// Bus operaton , byte, word or longword

class BusOp;
		// Operand length
		typedef enum {BYTE, WORD, LWRD} length_e;

		rand length_e len;

		// Weights for dist constraint

		bit [31:0] w_byte=1, w_word=3, w_lwrd=5;

		constraint c_len {
			len dist{BYTE := w_byte,		//Choose a random
					 WORD := w_word,		// length using
					 LWRD := w_lwrd};		// variable weights
			
		}
en dclass