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

#run SACRA to correct chimeric read for both HAP1 t72 and HepG2 t15 after canu correction. 
sh SACRA.sh -i /proj/LRS/canu_cor/HAP1_t72_1stcor.correctedReads.fasta -p /proj/LRS/chimeric_cor/HAP1_t72_SACRA_cor -t 16 -c config_HAP1_t72.yml
sh SACRA.sh -i /proj/LRS/canu_cor/HepG2_t15_1stcor.correctedReads.fasta -p /proj/LRS/chimeric_cor/HepG2_t15_SACRA_cor -t 16 -c config_HepG2_t15.yml

conda deactivate

#config_HAP1_t72.yml and config_HepG2_t15.yml used the same parameter as SACRA default config.yml except parameter pc. for HAP1, pc:50, for HepG2, pc:100
