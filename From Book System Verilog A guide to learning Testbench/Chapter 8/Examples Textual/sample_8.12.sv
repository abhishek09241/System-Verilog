// Sample 8.12 Copying extended handle to base handle

Transaction tr;
BadTr bad;
bad = new();		// Construct BadTr extended object
tr  = bad;			// Base handle points to extended obj
					// tr is downcast to point to BadTr type
$display("tr.src"); // Display variable in base class
tr.display;			// Call BadTr:: display