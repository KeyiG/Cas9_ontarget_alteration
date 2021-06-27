#!/bin/bash
#made by Keyi geng on 20190613

#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 5:00:00
#SBATCH -J rm_du
#SBATCH --output=rm_du.out
#SBATCH --error=rm_du.err

#module
module load bioinfo-tools
module load samtools/1.9
module load NGSUtils/0.5.9

BAM_PATH=/proj/alignment_BWA
OUTPUT_PATH=/proj/rmdubl


cd ${BAM_PATH}
for i in $(ls *.bam | sed 's/.bam//g'); do
	samtools sort -@ 8 -n -o ${OUTPUT_PATH}/${i}_nsort.bam ${i}.bam
	samtools fixmate -@ 8 -m ${OUTPUT_PATH}/${i}_nsort.bam ${OUTPUT_PATH}/${i}_fixmate.bam
	samtools sort -@ 8 -o ${OUTPUT_PATH}/${i}_positionsort.bam ${OUTPUT_PATH}/${i}_fixmate.bam
        samtools markdup -r -@ 8 ${OUTPUT_PATH}/${i}_positionsort.bam ${OUTPUT_PATH}/${i}_markdup.bam
	bamutils filter ${i}_markdup.bam \
        ${i}_rmdubl.bam \
        -excludebed /proj/rm_blacklist/hg38.blacklist.bed nostrand
	samtools sort -@ 8 -o ${i}_rmdubl_sorted.bam ${i}_rmdubl.bam
	samtools index -@ 8 ${i}_rmdubl_sorted.bam
done

