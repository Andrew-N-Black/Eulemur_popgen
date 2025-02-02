#The SLURM job below was used to run n=49 fecal-seq samples for 10 runs of K1-K10

#!/bin/bash
#SBATCH -A core
#SBATCH -p core 
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --mem=100G
#SBATCH --job-name=lemur_angsd

#for  ((i=1;i<=10;i++));  do mkdir R_$i; done
j="1"
while [ $j -lt 100 ]
do
  	for i in {1..10}
        do
                 ~/Software/NGSadmix -P 8  \
                -K ${i} -maxiter 50000 -tol 1e-9 -tolLike50 1e-9 \
                -likes revisedMin3Maf025.beagle.gz \
                -outfiles  ADX_R2/R_${j}/K${i}_R${j}
                i=$[$i+1]

        done
	j=$[$j+1]
done

#Repeat using three individuals removed (n=46)
#for  ((i=1;i<=10;i++));  do mkdir R_$i; done
while [ $j -lt 100 ]
do
  	for i in {1..10}
        do
                 ~/Software/NGSadmix -P 8  \
                -K ${i} -maxiter 50000 -tol 1e-9 -tolLike50 1e-9 \
                -likes revisedMin3Maf025Sub.beagle.gz \
                -outfiles  ADX_R3/R_${j}/K${i}_R${j}
                i=$[$i+1]

        done
	j=$[$j+1]
done
