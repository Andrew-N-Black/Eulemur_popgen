#Below is the SLURM job used to generate a covariation matrix with pcangsd

#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=100G
#SBATCH --job-name=lemur_angsd

pcangsd -b revised.beagle.gz --tree --admix -o filtered --threads 8
