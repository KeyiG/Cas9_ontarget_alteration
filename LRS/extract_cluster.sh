module load bioinfo-tools
module load samtools/1.12
module load BEDTools/2.29.2

for i in $(ls *.bam | sed 's/.bam//g'); do \
	for j in $(ls cluster*.bed | sed 's/.bed//g'); do \
		bedtools intersect -abam ${i}.bam -b ${j}.bed -u -F 1 > ${i}_${j}.bam
		samtools index ${i}_${j}.bam
	done
done
