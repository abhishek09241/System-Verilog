/*4. Create a testbench that randomizes the Exercise2 class 1000 times.
a. Count the number of times each address value occurs and print the results in
a histogram. Do you see an exact 10% / 80% / 10% distribution? Why or why
not?
b. Run the simulation with 3 different random seeds, creating histograms, and
then comment on the results. Here is how to run a simulation with the seed 42.
VCS: > simv +ntb_random_seed=42
IUS: > irun exercise4.sv −svseed 42
Questa: > vsim −sv_seed 42*/


/*Explanation for Results:

    Exact Distribution:
        You will not see an exact 10%/80%/10% distribution because randomization is probabilistic. The results will be close to the expected values but may vary due to statistical randomness.

    Effect of Random Seeds:
        Running the simulation with different seeds (+ntb_random_seed=42, etc.) will produce different random sequences, leading to slight variations in the histogram.

    Why the Variation?:
        The randomization process uses a pseudo-random number generator, and the distribution converges to the expected percentages only with a very large number of samples.

*/