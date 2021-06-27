#!/bin/bash
#Made by keyi Geng
#Made on 2020-10-13


#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 18
#SBATCH -t 20:00:00
#SBATCH -J canu_cor
#SBATCH --output=canu_cor.out
#SBATCH --error=canu_cor.err

#modules
module load bioinfo-tools
module load canu/2.0

#using canu to perform read correction for both HAP1 and HepG2 Xdrop-LRS data. Both data use same parameter.
canu -correct -p HAP1_t72_1stcor -d HAP1_t72_1stcor/ genomeSize=50m corOutCoverage=20000 -nanopore-raw /proj/fastq/SO100254_Bar01.fastq
canu -correct -p HepG2_t15_1stcor -d HepG2_t15_1stcor/ genomeSize=50m corOutCoverage=20000 -nanopore-raw /proj/fastq/SO100254_Bar02.fastq
