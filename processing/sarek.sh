#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 30
#SBATCH --mem=100G
#SBATCH --job-name=lemur_sarekR

nextflow run /local/cqls/software/nextflow/assets/nf-core-sarek_3.4.4/3_4_4/ -profile singularity -c sarek.config \
--input samplesheet_sarek.csv \
--outdir nfcore_sarek \
--igenomes_ignore \
--fasta GCF_041146395.1_OSU_ERuf_1_genomic.fna \
--trim_fastq \
--tools haplotypecaller \
--skip_tools baserecalibrator,vcftools \
--save_output_as_bam

#Merge duplicate samples from preprocessed bam files
for i in ` ls -1 *bam | tr "_" "\t" | cut -f 1 | sort -u` ; do samtools merge --threads 30 ./final_out/${i}.bam ${i}_*.bam; done
#Summary stats on files
cd final_out/
for i in `ls -1 *bam`
do
samtools depth -a ${i} | awk '{c++;s+=$3}END{print s/c}' > ${i}_depth.txt
samtools depth -a ${i} | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' > ${i}_1x_breadth.txt

samtools stats ${i} > ${i}_samtools_stats.tx
done
