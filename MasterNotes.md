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

The data was aligned to the reference genome sourced from NCBI using [this](https://github.com/dpb85/RNAseq-Project/blob/main/alb_bowtie.SBATCH) script; the reference code is GCA_000182965.3. The gtf file was chosen, as it will prove helpful downstream to use this type of annotation file. Results of the alignment can be found [here](https://docs.google.com/spreadsheets/d/1fa-FXVMlCXOZkbHSx_mMg0OXLMy9BeBJg8uWrEMpKGo/edit?gid=0#gid=0).

### Counting Reads

To count how many reads mapped to each gene, HTseq and [this](https://github.com/dpb85/RNAseq-Project/blob/main/htseq.SBATCH) script were used. The input files were the bam output file of the bowtie alignment and the gtf file pulled from NCBI.

## Downstream

Downstream analysis was performed in R. [TRUE AFTER ONTOLOGY??]

### Differential Expression Analysis

Differential gene expression was determined using DEseq2 using [this](https://github.com/dpb85/RNAseq-Project/blob/main/calb_DESeq_script_FINAL.R) script. Results show that [ADD THIS PART]

### Gene Ontology Analysis

[ADD THIS PART] - write in summary text. This pathway came up, number genex expected, number in our list, fold enrichment, p val, my interpretation of it.

 
Albicans, few genes have introns, so can use contiguous alignment

Questions: need the fastqc html? Or even link to it?

vitamin metabolism in canida
after trim, worked with SE
htseq counts all alignments
combined all htseq from all samples, ran through R script, got table of all genes in analysis the full change values, base read counts and result of stat test for diff expr, list in excel of diff expressed genes (13), generated PCA plot and volcano plot
