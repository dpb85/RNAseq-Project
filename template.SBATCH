#!/bin/bash
#SBATCH --job-name=template.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=dpb85@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- Load module-----------------------------------------------------------------#

shopt -s expand_aliases
module load trimmomatic

#- RUN command ----------------------------------------------------------------#

trimmomatic PE \
EC-12_R1_001.fastq.gz \
EC-12_R2_001.fastq.gz \
EC-12_R1_001_pairedend.fastq.gz EC-12_R1_001_singleend.fastq.gz \
EC-12_R2_001_pairedend.fastq.gz EC-12_R2_001_singleend.fastq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10

#- Unload module --------------------------------------------------------------#

module unload trimmomatic

#- FIN ------------------------------------------------------------------------#
