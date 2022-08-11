module load bioinfo-tools
module load samtools/1.12
module load BEDTools/2.29.2

#for HAP1 t72, since the reads mapped there are too many, for easy visualization, reads mapped to the three breakpoint are extracted as three cluster. 
#The bed files of the location are in the same folder, cluster1/2/3.bed.

for i in $(ls *.bam | sed 's/.bam//g'); do \
	for j in $(ls cluster*.bed | sed 's/.bed//g'); do \
		bedtools intersect -abam ${i}.bam -b ${j}.bed -u -F 1 > ${i}_${j}.bam
		samtools index ${i}_${j}.bam
	done
done
