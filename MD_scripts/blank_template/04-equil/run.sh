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

#In case there are problems capture some info about the run environment
hostname
which mpirun
echo $PATH
echo $LD_LIBRARY_PATH
echo '------------------------------------------------------------------------'
echo "Starting @ `date`"

# Make sure file path matches your directory structure!
pmemd.cuda -O -i equil.1.in -o equil.1.out -p ../01-prep/hmass.parm7 -c ../03-heat/heat.ncrst -r equil.1.ncrst -ref ../03-heat/heat.ncrst -x equil.1.nc
pmemd.cuda -O -i equil.2.in -o equil.2.out -p ../01-prep/hmass.parm7 -c ../04-equil/equil.1.ncrst -r equil.2.ncrst -ref ../04-equil/equil.1.ncrst -x equil.2.nc
pmemd.cuda -O -i equil.3.in -o equil.3.out -p ../01-prep/hmass.parm7 -c ../04-equil/equil.2.ncrst -r equil.3.ncrst -ref ../04-equil/equil.2.ncrst -x equil.3.nc
pmemd.cuda -O -i equil.4.in -o equil.4.out -p ../01-prep/hmass.parm7 -c ../04-equil/equil.3.ncrst -r equil.4.ncrst -ref ../04-equil/equil.3.ncrst -x equil.4.nc
pmemd.cuda -O -i equil.5.in -o equil.5.out -p ../01-prep/hmass.parm7 -c ../04-equil/equil.4.ncrst -r equil.5.ncrst -ref ../04-equil/equil.4.ncrst -x equil.5.nc

# Organizes intermediate files into folders
mkdir -p equil.1.ncrstFiles 
mkdir -p equil.2.ncrstFiles
mkdir -p equil.3.ncrstFiles
mkdir -p equil.4.ncrstFiles
mkdir -p equil.5.ncrstFiles

# Moves log files to their respective folder after completion
mv equil.1.ncrst_* equil.1.ncrstFiles/ 
mv equil.2.ncrst_* equil.2.ncrstFiles/
mv equil.3.ncrst_* equil.3.ncrstFiles/
mv equil.4.ncrst_* equil.4.ncrstFiles/
mv equil.5.ncrst_* equil.5.ncrstFiles/

echo "All done @ `date`"
