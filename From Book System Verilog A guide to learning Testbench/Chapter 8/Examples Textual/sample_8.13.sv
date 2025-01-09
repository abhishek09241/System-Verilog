// Sample 8.13 Copying a base handle to an extended handle


tr  = new();					// Construct base object
bad = tr;						// ERROR: WILL NOT COMPILE
$display(bad.bad_csm); 			// bad_csm is only in extended object