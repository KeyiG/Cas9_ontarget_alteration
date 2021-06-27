#!/bin/bash
#Made on 200609

#UPPMAX commands
#SBATCH -A proj_num 
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 3:00:00

module load bioinfo-tools
module load FastQC/0.11.8

fastqc *


