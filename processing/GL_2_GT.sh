#!/bin/bash
#SBATCH -A core
#SBATCH -p core
#SBATCH -n 8
#SBATCH --job-name=callGeno
#SBATCH -e gt.err
#SBATCH -o gt.o
#SBATCH --mem=100G

REF=/nfs7/IB/Everson_Lab/BLACK/POP/raw/GCF_041146395.1_OSU_ERuf_1_genomic.fna
WD=/nfs7/IB/Everson_Lab/BLACK/POP/final_bams
#Generate angsd output files for all OK regions
cd $WD
angsd -P 8 \
-bam ./revised_bams.txt -doBcf 1 -gl 1 -dopost 1 -domajorminor 1 -domaf 1 -minMaf 0.05 -rmTriallelic 1  \
-setMinDepthInd 3 -minInd 36 -minMapQ 20 -minQ 20 -SNP_pval 1e-6  -ref $REF -anc $REF -out ../angsd_out/lemur-DOC3-maf.05

cd ../angsd_out
#wget https://faculty.washington.edu/browning/beagle/beagle.27Jan18.7e1.jar
#chmod +x beagle.27Jan18.7e1.jar

#Convert BCF to VCF
#autosomes
bcftools convert -O b -o lemur-DOC3-maf.05.vcf lemur-DOC3-maf.05.bcf

#Use beagle to call genotypes from Genotype likelihoods
#Autosomes
java -Xmx300g -jar beagle.27Jan18.7e1.jar gl=lemur-DOC3-maf.05.vcf out=lemur.genotypes
