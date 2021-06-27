#!/bin/bash

#UPPMAX commands
#SBATCH -A $UPPMAX_COMPUTE_PROJ_NUMBER
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J minimap
#SBATCH --output=minimap.out
#SBATCH --error=minimap.err

#modules
module load bioinfo-tools
module load minimap2/2.16
module load samtools/1.10

#minamap index the region of interest(ROI), e.g hg38, target region, vectors for transfection. For assembly purpose, seqeunce of target region and its flanking was used to extract aligned reads for both HAP1 and HepG2.Seqeunce of Cas9 vector px459 was used to extract HepG2 mapped reads to further extend the contig. 
minimap2 -x map-ont -t 8 -d ROI.mmi ROI.fa
#input fastq files could be raw fastq or corrected fastq after Canu and SACRA coorection.
minimap2 -ax map-ont -t 6 ROI.mmi ${INPUT_FA}/input.fq | samtools sort -@ 2 > LRS_sorted.bam
samtools index -@ 8 LRS_sorted.bam

