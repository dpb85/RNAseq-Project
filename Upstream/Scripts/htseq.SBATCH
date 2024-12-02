#!/bin/bash
#SBATCH --job-name=htseq.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=dpb85@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- Load module-----------------------------------------------------------------#

source activate htseq

#- Set variables --------------------------------------------------------------#

htseq=/home/dpb85/.conda/envs/htseq/bin/htseq-count
bam=/home/dpb85/WTB1.srt.bam
annotation=/home/dpb85/GCF_000182965.3_ASM18296v3_genomic.gtf

#- RUN command ----------------------------------------------------------------#

$htseq -f bam \
-r pos \
-s no \
-t exon \
-i gene_id \
$bam \
$annotation \
> /home/dpb85/WTB1_htseqCount

#- FIN ------------------------------------------------------------------------#
