#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=h3k27me3_chipseq_ko
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=michael.smallegan@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=30gb
#SBATCH --time=1:00:00
#SBATCH --output=h3k27me3_chip_macs.out
#SBATCH --error=h3k27me3_chip_macs.err

date; hostname
source ~/anaconda3/bin/activate macs3
macs3 callpeak -f BAMPE -t /scratch/Shares/rinn/JR/FIRRE_KO_TG_K27me3_CHIPSEQ/results_all_individual_runs/bwa/mergedLibrary/KOiTg_48_IP_R1.mLb.clN.sorted.bam -c /scratch/Shares/rinn/JR/FIRRE_KO_TG_K27me3_CHIPSEQ/results_all_individual_runs/bwa/mergedLibrary/KOiTg_48_R1.mLb.clN.sorted.bam -g mm -n ko_itg_h3k27me3_chipseq --broad --broad-cutoff 0.1 -B
date
