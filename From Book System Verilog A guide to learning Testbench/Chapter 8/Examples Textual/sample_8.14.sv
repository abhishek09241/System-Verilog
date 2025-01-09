// Sample 8.14 Using $cast to copy handles

Transaction tr;
BadTr bad, bad2;

bad = new();		// Construct BadTr extended object
tr  = bad;			// Base handle points to extended object

// Check the object type and copy. SImulation error if Mismatch
// If successful, bad2 points to the object referenced by tr

$cast(bad2, tr) ;


// Check for type  mismatch, no simulation error

if($cast(bad2, tr));
	$display("bad2.bad_csm");			// bad_csm exists in original object
else
	$display("ERROR: cannot assign tr to bad2");