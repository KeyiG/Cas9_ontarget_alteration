module load bioinfo-tools
module load samtools/1.10
module load SeqKit/0.15.0

#extract the aligned reads name
samtools view -F 4 aligned_LRS_sorted.bam | cut -f1 | sort | uniq > LRS_target_alig_readname.txt
#Extract the reads from fastq file (raw fastq files or corrected fastq files as input fastq file: input.fq)
seqkit grep --pattern-file LRS_target_alig_readname.txt input.fq > LRS_target_alig.fq

