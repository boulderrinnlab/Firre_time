#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=h3k27me3_chipseq
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=michael.smallegan@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100gb
#SBATCH --time=10:00:00
#SBATCH --output=h3k27me3_chip_macs.out
#SBATCH --error=h3k27me3_chip_macs.err
date; hostname

BASE_PATH=/scratch/Shares/rinn/JR/FIRRE_KO_TG_K27me3_CHIPSEQ/results_all_individual_runs/bwa/mergedLibrary
source ~/anaconda3/bin/activate macs3
macs3 callpeak -f BAMPE -t \
${BASE_PATH}/KO_CTL_48_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KO_CTL_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KOiTg_48_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KOiTg_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WT_CTL_48_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WT_CTL_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WTiTg_48_IP_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WTiTg_IP_R1.mLb.clN.sorted.bam \
-c \
${BASE_PATH}/KO_CTL_48_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KO_CTL_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KOiTg_48_R1.mLb.clN.sorted.bam \
${BASE_PATH}/KOiTg_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WT_CTL_48_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WT_CTL_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WTiTg_48_R1.mLb.clN.sorted.bam \
${BASE_PATH}/WTiTg_R1.mLb.clN.sorted.bam \
-g mm -n FIRRE_H3K27me3_chipseq_combined --broad --broad-cutoff 0.1 -B
date
