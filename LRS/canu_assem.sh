#!/bin/bash
#Made by keyi Geng
#Made on 2020-10-13

#UPPMAX commands
#SBATCH -A proj_number
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -J aliROI_canu
#SBATCH --output=aliROI_canu.out
#SBATCH --error=aliROI_canu.err

#modules
module load bioinfo-tools
module load minimap2/2.16
module load samtools/1.10
module load SeqKit/0.15.0
module load canu/2.0

#the input is the aligned reads extract using script: extract_map_read.sh.
#for corrected read assembly (since before alignment and reads extraction, the reads have been corrected by canu, so skip correction step):
canu -trim-assemble -p assembly -d assembly genomesize=2m -nanopore-corrected LRS_target_alig.fq


#for raw read assembly(since the reads haven't been corrected by canu, so perform correction, trim and assembly step):
canu -p assembly -d assembly genomesize=2m -nanopore-raw LRS_target_alig.fq

#the genome size is adjusted based on the number of the read extracted. For HAP1 t72 assemble, genomesize was set around 2m; for HepG2 t15, genomesize was set around 10K 

