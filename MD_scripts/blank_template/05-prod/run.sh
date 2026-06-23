#!/bin/bash
#SBATCH -D ./  # Set the working directory
#SBATCH --mail-user=YOUREMAIL@tcnj.edu       # Who to send emails to
#SBATCH --mail-type=FAIL                     # Send emails on start, end and failure
#SBATCH --job-name=prod                      # Name to show in the job queue
#SBATCH --ntasks=1                           # Total number of mpi tasks requested
#SBATCH --nodes=1                            # Total number of nodes requested
#SBATCH --gres=gpu:1                         # Include GPU generic resource
#SBATCH --partition=gpu                      # Partition (a.k.a. queue) to use
#SBATCH --constraint=l40s		                 # select desired hardware type

# Can change to an older version of amber if you need a specific feature
module load amber

#In case there are problems capture some info about the run environment
hostname
which mpirun
echo $PATH
echo $LD_LIBRARY_PATH
echo '------------------------------------------------------------------------'
echo "Starting @ `date`"

# Make sure file path matches your directory structure!
pmemd.cuda -O -i prod.in -o prod.out -p ../../01-prep/hmass.parm7 -c ../../04-equil/equil.5.ncrst -ref ../../04-equil/equil.5.ncrst -r prod.ncrst -x prod.nc

echo "All done @ `date`"

