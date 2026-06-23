#!/bin/bash
#SBATCH -D ./                           # Set the working directory
#SBATCH --mail-user=YOUREMAIL@tcnj.edu  # Who to send emails to
#SBATCH --mail-type=FAIL                # Send emails on start, end and failure
#SBATCH --job-name=heat                 # Name to show in the job queue
#SBATCH --ntasks=1                      # Total number of mpi tasks requested
#SBATCH --nodes=1                       # Total number of nodes requested
#SBATCH --gres=gpu:1                    # Include GPU generic resource
#SBATCH --partition=gpu                 # Partition (a.k.a. queue) to use
#SBATCH --constraint=l40s		            # set the hardware type desired

# Can change to an older verion of amber if you need a specific feature
module load amber

# In case there are problems capture some info about the run environment
hostname
which mpirun
echo $PATH
echo $LD_LIBRARY_PATH
echo '------------------------------------------------------------------------'
echo "Starting @ `date`"
# Make sure file path matches your directory setup
pmemd.cuda -O -i heat.in -o heat.out -p ../01-prep/hmass.parm7 -c ../02-min/min.ncrst -r heat.ncrst -ref ../02-min/min.ncrst -x heat.nc

echo "All done @ `date`"

