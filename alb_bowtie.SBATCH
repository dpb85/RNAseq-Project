#!/bin/bash
#SBATCH --job-name=bowtie --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=dpb85@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#-----------------------------------------------------------------------------#
# This script runs bowtie to match reads to the reference genome  #
#-----------------------------------------------------------------------------#

#-------------------establish environment, load module-----------------------#

module load bowtie2

#- Set variables --------------------------------------------------------------$

PE_1=/home/dpb85/clean_reads/WTB1_1_trPE.fq

PE_2=/home/dpb85/clean_reads/WTB1_2_trPE.fq

#- RUN Bowtie2-------------------------------------------------------------$

bowtie2 \
-x index \
-1 $PE_1 \
-2 $PE_2 \
-S WTB1.sam
