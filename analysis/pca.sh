#Below is the SLURM job used to generate a covariation matrix with pcangsd

#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=100G
#SBATCH --job-name=lemur_angsd

#Run will all 49 samples and a minor allele frequency cutoff of 0.025
pcangsd -b revisedMin3Maf025.beagle.gz --tree --admix -o revisedMin3Maf025 --threads 8

#Run will three samples removed and a minor allele frequency cutoff of  0.025
pcangsd -b revisedMin3Maf025Sub.beagle.gz --tree --admix -o revisedMin3Maf025Sub --threads 8
