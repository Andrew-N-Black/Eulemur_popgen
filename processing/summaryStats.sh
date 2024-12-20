#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH --mem=20G
#SBATCH --job-name=lemur_stats

#Summary stats on files
for i in `ls -1 *bam`
do
samtools depth -a ${i} | awk '{c++;s+=$3}END{print s/c}' > ${i}_depth.txt
samtools depth -a ${i} | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' > ${i}_1x_breadth.txt

samtools stats ${i} > ${i}_samtools_stats.tx
done
