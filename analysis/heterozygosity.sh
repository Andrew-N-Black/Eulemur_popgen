#!/bin/bash
#SBATCH --job-name=lemur_het
#SBATCH -A core
#SBATCH -p core
#SBATCH -N 1 
#SBATCH -n 20 
#SBATCH -e %x_%j.err
#SBATCH -o %x_%j.out



#Path to parent directory of genus-species
REF=../raw/GCF_041146395.1_OSU_ERuf_1_genomic.fna


mkdir ./HET
OUTDIR='HET'

ls -1 ../final_bams/*bam | sed 's/\//\'$'\t/g' | cut -f 3| sed 's/.bam//g' |sed 's/_filt//g'|  while read -r LINE

do

angsd -i ../final_bams/${LINE}.bam -ref $REF -anc $REF -dosaf 1 -minQ 30 -GL 1 -P 20 -out ${OUTDIR}/${LINE} 

realSFS -P 20 -fold 1 ${OUTDIR}/${LINE}.saf.idx > ${OUTDIR}/${LINE}_est.ml

done

#Get individual heterozygosity, proportion of heterozygotes:
cat ./*ml

#Use output from cat command for calculate prop heterozygote
#DONE
