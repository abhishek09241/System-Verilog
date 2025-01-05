/*8. Create a class for a graphics image that is 10x10 pixels. The value for each
pixel can be randomized to black or white. Randomly generate an image that is,
on average, 20% white. Print the image and report the number of pixels of each
type.*/


class Graphics_images;

	// Declare a 2D array for the 10X10 pixel image
	rand bit [0:9][0:9] pixels;



	// Constraint to ensure approximately 20% of the pixels are white

	constraint white_pixels_20 {
			foreach(pixels[i,j]){
				pixels[i][j] dist {1:=20,0:=80};		// 20% white(1), 80% black(0)
				}
		
	}


	// Method to count and report the number of white and black pixels

	function void report_pixel_counts();
			int white_count = 0;
			int black_count = 0;

			// Count white and black pixels

			foreach (pixels[i,j]) begin
				if (pixels[i][j]==1) begin
					white_count++;
				end
				else
					black_count++;
			end


			// Print the counts
			$display("White Pixels: %0d", white_count);
			$display("Black Pixels: %0d", black_count);

	endfunction : report_pixel_counts


	// Method to print the image

	function void print_image();
			$display("Generated Image:");
			foreach (pixels[i]) 
				begin
					foreach (pixels[i][j]) 
						begin
							if (pixels[i][j]==1) 
								begin
									$write("White ");		//White pixel	
								end
							else
								begin
									$write("Black ");					
								end				
						end				

						$display(" ");   // Newline after each row
				end
	endfunction : print_image

	
endclass : Graphics_images


module question8;

	Graphics_images images;

	initial
		begin
			images = new();

			// Randomize the imagee
				assert(images.randomize()) else $fatal("Image randomization failed!");

			// Print the image
				images.print_image();

			// Report the number of white and black pixels
				images.report_pixel_counts();	

		end

endmodule : question8