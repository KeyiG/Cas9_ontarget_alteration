#!/bin/bash
#Made by keyi Geng, adapted from Christoffer's script


#UPPMAX commands
#SBATCH -A proj_num
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH -J raven
#SBATCH --output=raven.out
#SBATCH --error=raven.err

#activate raven package environment on UPPMAX.
module load conda
export CONDA_ENVS_PATH=/proj/private/software/
source conda_init.sh
conda activate raven

#the input is the aligned reads extract using script: extract_map_read.sh. 
raven --weaken --graphical-fragment-assembly raven_assembly.gfa --threads 16 LRS_target_alig.fq > raven_assembly.fasta

conda deactivate
