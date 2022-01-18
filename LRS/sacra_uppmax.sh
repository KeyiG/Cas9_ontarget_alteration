#!/bin/bash
#Made by keyi Geng
#Made on 2020-10-13


#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH -J sacra
#SBATCH --output=sacra.out
#SBATCH --error=sacra.err

#activate SACRA package environment on UPPMAX.
module load conda
export CONDA_ENVS_PATH=/proj/private/software/
source conda_init.sh
conda activate sacra
module load bioinfo-tools
module load samtools

#run SACRA to correct chimeric read after canu correction. sample.correctedReads.fasta here is the canu corrected reads for our Xdrop-LRS data for different samples.
sh SACRA.sh -i /proj/LRS/canu_cor/sample.correctedReads.fasta -p /proj/LRS/chimeric_cor/sample_SACRA_cor -t 16 -c config.yml

conda deactivate

#config.yml and config_HepG2_t15.yml used the same parameter as SACRA default except parameter pc and sl. for HAP1 t72, HepG2 t8, HepG2 i50: pc:50, for HepG2 t15, pc:100, and for all samples, sl is 1000.
