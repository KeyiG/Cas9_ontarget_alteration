#!/bin/bash
#Made by keyi Geng
#Made on 180819 modified on 190127


#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 06:00:00
#SBATCH -J bedgraph
#SBATCH --output=bedgraph.out
#SBATCH --error=bedgraph.err


#modules
module load bioinfo-tools
module load deepTools/3.1.0

BAM_PATH=/proj/rmdubl
OUTPUT=/proj/bedgraph

cd ${BAM_PATH}
for i in $(ls *_rmdubl_sorted.bam | sed 's/_rmdubl_sorted.bam//g'); do \
	bamCoverage \
		 --bam ${i}_rmdubl_sorted.bam \
		--outFileName ${OUTPUT}/${i}_norm1x.bedgraph \
		--effectiveGenomeSize 2913022398 \
		--normalizeUsing RPGC \
		--extendReads 81 \
		--binSize 50 \
		--outFileFormat bedgraph \

done



#in older version, argument normalizeTo1x are used followed by effective size, but in lastest version 3.1.3, two argument effectiveGenomeSize and normalizeUsing are used. and RPGC is 1x normalized method also recommended in ChIP-seq sample of their manual.

