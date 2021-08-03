#loading packages on uppmax
module load bioinfo-tools
module load samtools/1.9

#remove the read alignment that contains soft-clipped reads and index
samtools view -h ChIP_ali.bam | awk '$6 !~ /H|S/{print}' | samtools view -bS > ChIP_ali_nosc.bam
samtools index ChIP_ali_nosc.bam
