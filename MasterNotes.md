# Workflow for Canida albicans Grown in Thi +/- 

## Upstream

Data on read quality and quantity before and after cleaning can be found [here](https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0).

### Sourcing Data

Data was drawn from a study done by Dr. Rolfes of Georgetown University. Note, this analysis will focus on the paired end reads.

### Trimming Data and Quality Control

First, quality control was run on the raw data files by running an initial FastQC analysis. This yielded evidence of weakness in the per-base sequence content and sequence duplication. Trimmomatic was used to remove these low quality reads. [This](https://github.com/dpb85/RNAseq-Project/blob/main/albicans.SBATCH) was the Trimmomatic script used.

Errors were initially found for the per-base sequence content, as the machine was still learning to locate the clusters. For this reason, we used headcrop to cut the first 15 bases. High sequence duplication may be due to contamination or due to a gene with high expression. Nevertheless, given that there are 20,000,000 reads, the 500 replicats of one read that was flagged is not of great concern, as it represents a small percentage of the genome.

Fastqc was run through interactive mode. Results of the cleaning [here](https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0) show that per-base sequence content improved.

### Aligning to Reference Genome

The data was aligned to the reference genome sourced from NCBI using [this](https://github.com/dpb85/RNAseq-Project/blob/main/alb_bowtie.SBATCH) script; the reference code is GCA_000182965.3.

### Counting Reads

## Downstream

### Differential Expression Analysis
### Gene Ontology Analysis



Using the albicans.SBATCH script, the raw data files were processed using Trimmomatic. This eliminated the weaknesses of the raw data files in the PE files, as seen in files WTB1_1_trPE_fastqc.html and WTB1_2_trPE_fastqc.html. The per-base sequence content was improved, though the sequence duplication remained high.

For aligning these reads with the refence sequence, Bowtie was used. The reference sequence chosen was the genome GCF_000182965.3 off of the NCBI database. The gtf file was chosen, as it will prove helpful down the road to use this type of annotation file.

Reads will be counted with HTseq.

Differental expression will be determined using DEseq2 in R. 

Albicans, few genes have introns, so can use contiguous alignment

Questions: need the fastqc html? Or even link to it?
