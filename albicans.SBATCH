#!/bin/bash
#SBATCH --job-name=trim --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=dpb85@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#-----------------------------------------------------------------------------#
# This script runs trimmomatic to clean up raw reads #
#-----------------------------------------------------------------------------#

#-------------------establish environment, load module-----------------------#

shopt -s expand_aliases
module load trimmomatic

#- Set variables --------------------------------------------------------------$

raw_dir=/home/dpb85/raw_reads

clean_dir=/home/dpb85/clean_reads

adapter=/home/dpb85/TruSeq3-PE.fa:2:30:10

#- RUN Trimmomatic-------------------------------------------------------------$

files=(${raw_dir}/*_1.fq.gz)
for file in ${files[@]}
do
name=${file}
base=`basename ${name} _1.fq.gz`

trimmomatic PE \
          ${raw_dir}/${base}_1.fq.gz \
          ${raw_dir}/${base}_2.fq.gz \
          ${clean_dir}/${base}_1_trPE.fq.gz ${clean_dir}/${base}_1_trSE.fq.gz \
          ${clean_dir}/${base}_2_trPE.fq.gz ${clean_dir}/${base}_2_trSE.fq.gz \
          ILLUMINACLIP:${adapter}:2:30:10 \
          HEADCROP:15 \
          TRAILING:10 \
          SLIDINGWINDOW:4:15 \
          MINLEN:75

done
