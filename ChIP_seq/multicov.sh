module load bioinfo-tools
module load BEDTools

bedtools multicov -D -q 1 -bams *.bam -bed hg38-tRNAs.bed > Cas9_ontarget_pol3_counting.txt
#*.bam is the bam files of all samples. The bam file has been processed with PCR duplication removal and exluded the reads in the blasklist. 
