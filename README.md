# RNAseq project

This study will explore the changes in gene expression between _Candida albicans_ organisms experiencing diapause and those not, in order to better understand the genetic factors responsible for this change in behavior.

This branch of the study will focuse on the "B" biological replicate of _Candida albicans_. Specifically, the Thi+ version of this replicate; that is, WTB1.  

First quality control was run on the raw data files (WTB1_1.fq.gz and WTB1_2.fq.gz) by running an initial FastQC analysis. This yielded evidence of weakness in the per-base sequence content and sequence duplication, as seen in filees WTB1_1_fastqc.html and WTB1_2_fastqc.html. Errors were found in the beginning for the per-base sequence content, as the machine was still learning to locate the clusters. For this reason, we will use HEADCROP to cut the first 15 bases. High sequence duplication may be due to contamination or due to a gene with high expression. Nevertheless, given that there are 20,000,000 reads, 500 replicats of one read is not of great concern, as it represents a small percentage of the genome.

Using the albicans.SBATCH script, the raw data files were processed using Trimmomatic. This eliminated the weaknesses of the raw data files in the PE files, as seen in files WTB1_1_trPE_fastqc.html and WTB1_2_trPE_fastqc.html. The per-base sequence content was improved, though the sequence duplication remained high.

For aligning these reads with the refence sequence, Bowtie was used. The reference sequence chosen was the genome GCF_000182965.3 off of the NCBI database. The gtf file was chosen, as it will prove helpful down the road to use this type of annotation file.

Reads will be counted with HTseq.

Differental expression will be determined using DEseq2 in R. 

Albicans, few genes have introns, so can use contiguous alignment
