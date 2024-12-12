#Below was the SLURM script used to generate genotype likelihoods with Angsd

#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=100G
#SBATCH --job-name=lemur_angsd

REF=/nfs7/IB/Everson_Lab/BLACK/POP/raw/GCF_041146395.1_OSU_ERuf_1_genomic.fna 

#Generate angsd output files for all OK regions
angsd -P 8 -out ../angsd_out/revised \
-bam ./revised_bamlist.txt -doCounts 1 -GL 1 -doGlf 2 -doMajorMinor 4 -doMaf 1 -minMaf 0.05 -rmTriallelic 1  \
-minInd 36 -minMapQ 20 -minQ 20 -SNP_pval 1e-6  -ref $REF -anc $REF
