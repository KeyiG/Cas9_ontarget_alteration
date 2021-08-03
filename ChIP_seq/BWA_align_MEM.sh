#!/bin/bash
#Made by keyi Geng
#Made on 180823

#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J BWA_MEM
#SBATCH --output=bwa_mem.out
#SBATCH --error=bwa_mem.err

#module 
module load bioinfo-tools
module load bwa/0.7.17
module load samtools/1.9

FQ_PATH=/proj/fastq
OUTPUT_PATH=/proj/BWA_alignment
REF_PATH=/proj/reference_hg38

#the ref.fa is the reference sequence. hg38 human reference genome or contig assembled.
bwa index ${REF_PATH}/ref.fa
cd ${FQ_PATH}
for i in $(ls *.fastq.gz | sed 's/.fastq.gz//g'); do
	bwa mem -t 6 ${REF_PATH}/ref.fa ${i}.fastq.gz | samtools sort -@ 2 -o ${OUTPUT_PATH}/${i}.bam
done

module unload bwa/0.7.17
module unload samtools/1.9
