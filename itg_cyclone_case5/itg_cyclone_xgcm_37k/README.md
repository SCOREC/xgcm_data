## ITG Cyclone Circular Geometry Case 5

This case uses only 37k mesh elements. The case could be run using 8 poloidal planes, 1 group and a total of 16 MPI ranks.

To run this case:
1. the code needs to be compiled with compiler flag XGC_FLAGS "-DINIT_GENE_PERT" turned on. This will enable an initial electrostatic potential perturbation distribution. 
Except the name, this has nothing to do with "GENE" code. The name of the compiler flag is to be consistent with XGC1.
2. modify the email address in the run script "run_cori.sh"
3. run the code with ./run_cori.sh 
