#!/bin/bash
#SBATCH -D ./  # Set the working directory, this command specifically runs from where you currently are
#SBATCH --mail-user=YOUREMAIL@tcnj.edu          # Who to send emails to, can change to your email if you want get updates
#SBATCH --mail-type=FAIL                        # Send emails on start, end and failure
#SBATCH --job-name=tleap                        # Name to show in the job queue, can change if you want
#SBATCH --ntasks=1                              # Total number of mpi tasks requested, only change if you need to parallelize tasks
#SBATCH --nodes=1                               # Total number of nodes requested
#SBATCH --partition=normal                      # Partition (a.k.a. queue) to use
# #SBATCH --constraint=<your constraint here>   # constrains to a specific model. Only necessary if you need a specific feature of a machine.

module load amber # can change to a specific version of amber if necessary

# In case there are problems capture some info about the run environment
hostname
which mpirun
echo $PATH
echo $LD_LIBRARY_PATH
echo '------------------------------------------------------------------------'
echo "Starting @ `date`"

# script to build parameters
tleap -f tleap.in > tleap.log

# script to apply hydrogen mass repartitioning
parmed -O -i parmed.in > parmed.log

# script to make a version of the system with only peptide and no water/ions in it
cpptraj -i cpptraj.in > cpptraj.log

echo "All done @ `date`"

