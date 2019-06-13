#!/usr/bin/env zsh

### Job name
#SBATCH --job-name=testRZ
 
### File / path where STDOUT will be written, the %J is the job id
#SBATCH --output=testRZ.%J
 
### Time your job needs to execute, e. g. 30 min
#SBATCH --time=5-00:00:00

### Memory your job needs per node, e. g. 500 MB
#SBATCH --mem=4000M

### Use one node for parallel jobs on shared-memory systems
#SBATCH --nodes=1

### Number of threads to use, e. g. 24
#SBATCH --cpus-per-task=4

### Number of hyperthreads per core
#SBATCH --ntasks-per-core=1

#SBATCH --account=rwthxxxx

#SBATCH --mail-user=X.X@iehk.rwth-aachen.de
 
### Change to the work directory
cd $WORK/testRZ
 
### load modules and execute
module load TECHNICS abaqus/2017

# name your job HERE, name it DIFFERENT from your input file!
JOBNAME=testRZ
INPUTFILE=testRZ.inp 
 
# launch-command for abaqus 6.8 and higher versions, please remember,
# to adjust the memory, it must be less than requested above
abaqus interactive job=$JOBNAME input=$INPUTFILE mp_mode=THREADS cpus=$SLURM_CPUS_PER_TASK memory=4000mb user=XXX.f