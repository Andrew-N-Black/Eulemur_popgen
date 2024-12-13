#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=100G
#SBATCH --job-name=lemur_fst



REF=/nfs7/IB/Everson_Lab/BLACK/POP/raw/GCF_041146395.1_OSU_ERuf_1_genomic.fna 

#Angsd need the reference to be indexed first
#samtools faidx REF=/nfs7/IB/Everson_Lab/BLACK/POP/raw/GCF_041146395.1_OSU_ERuf_1_genomic.fna 


#first calculate per pop site allele frequency likelihoods (saf) for each population
#saf for E. cinereiceps

angsd -P 8 -out ../angsd_out/FST/CIN \
-minInd 12 -minMapQ 20 -minQ 20 \
-bam ./cinereiceps.txt -doCounts 1 -GL 1 -doSaf 1 -anc $REF -ref $REF

#first calculate per pop site allele frequency likelihoods (saf) for each population
#saf for E. rufifrons

angsd -P 8 -out ../angsd_out/FST/RUF \
-minInd 14 -minMapQ 20 -minQ 20 \
-bam ./rufifrons.txt -doCounts 1 -GL 1 -doSaf 1 -anc $REF -ref $REF

#first calculate per pop site allele frequency likelihoods (saf) for each population
#saf for hybrids

angsd -P 8 -out ../angsd_out/FST/HYB \
-minInd 13 -minMapQ 20 -minQ 20 \
-bam ./hybrids.txt -doCounts 1 -GL 1 -doSaf 1 -anc $REF -ref $REF

#Move to different directory
cd ../angsd_out/

#calculate the 1D SFS from allele freq likelihoods
realSFS FST/CIN.saf.idx -P 8 -fold 1 > FST/CIN.sfs
realSFS FST/RUF.saf.idx -P 8 -fold 1 > FST/RUF.sfs
realSFS FST/HYB.saf.idx -P 8 -fold 1 > FST/HYB.sfs


#calculate the 2D SFS
realSFS FST/CIN.saf.idx FST/RUF.saf.idx -P 8 > FST/CIN.RUF.ml
realSFS FST/CIN.saf.idx FST/HYB.saf.idx -P 8 > FST/CIN.HYB.ml
realSFS FST/RUF.saf.idx FST/HYB.saf.idx -P 8 > FST/RUF.HYB.ml



#Now pairwise Fsts

#Index sample so same sites are analyzed for each pop
mkdir FST/out
realSFS fst index FST/CIN.saf.idx FST/RUF.saf.idx -sfs FST/CIN.RUF.ml -fstout FST/CIN_RUF -P 8
realSFS fst index FST/CIN.saf.idx FST/HYB.saf.idx -sfs FST/CIN.RUF.ml -fstout FST/CIN_RUF -P 8
realSFS fst index FST/RUF.saf.idx FST/HYB.saf.idx -sfs FST/RUF.HYB.ml -fstout FST/RUF_HYB -P 8

#Global pairwise estimates
realSFS fst stats FST/CIN_RUF.fst.idx 
realSFS fst stats FST/CIN_HYB.fst.idx
realSFS fst stats FST/RUF_HYB.fst.idx




#sliding window analysis among all population samples

realSFS fst index FST/CIN.saf.idx FST/RUF.saf.idx FST/HYB.saf.idx -sfs FST/CIN.RUF.ml -sfs FST/CIN.HYB.ml -sfs FST/RUF.HYB.ml -fstout FST/three_pop -P 8

realSFS fst stats2 FST/three_pop.fst.idx -win 50000 -step 25000 -P 8 > FST/slidingwindow

#Calculate average fst for each sliding windown analysis:
#cut -f 5 slidingwindow | tail -n +2 | awk '{ sum += $1 } END { print(sum / NR) }'

#cut -f 6 slidingwindow | tail -n +2 | awk '{ sum += $1 } END { print(sum / NR) }'

#cut -f 7 slidingwindow | tail -n +2 | awk '{ sum += $1 } END { print(sum / NR) }'

#cut -f 8 slidingwindow | tail -n +2 | awk '{ sum += $1 } END { print(sum / NR) }'


#DONE
