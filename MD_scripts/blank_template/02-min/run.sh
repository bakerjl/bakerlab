#!/bin/bash
#SBATCH -D ./                            # Set the working directory
#SBATCH --mail-user=YOUREMAIL@tcnj.edu   # Who to send emails to
#SBATCH --mail-type=FAIL                 # Send emails on start, end and failure
#SBATCH --job-name=min                   # Name to show in the job queue
#SBATCH --ntasks=1                       # Total number of mpi tasks requested
#SBATCH --nodes=1                        # Total number of nodes requested
#SBATCH --partition=gpu                  # Partition (a.k.a. queue) to use
#SBATCH --gres=gpu:1			               # Select a single GPU device
#SBATCH --constraint=l40s		             # use a specific type of hardware - may or may not be necessary. Can also change to an older machine if newer ones are in use.

module load amber

#In case there are problems capture some info about the run environment
hostname
which mpirun
echo $PATH
echo $LD_LIBRARY_PATH
echo '------------------------------------------------------------------------'
echo "Starting @ `date`"

# Make sure file path matches your directory setup!
pmemd.cuda -O -i min.in -o min.out -p ../01-prep/hmass.parm7 -c ../01-prep/sys.rst7 -r min.ncrst -ref ../01-prep/sys.rst7

echo "All done @ `date`"

