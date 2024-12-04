# Workflow for _Candida albicans_ grown in Thi +/- 

## Upstream

Data on read quality and quantity before and after cleaning can be found [here](https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0).

### Sourcing Data

Data was drawn from a study done by Dr. Rolfes of Georgetown University. 

### Trimming Data and Quality Control

First, quality control was run on the raw data files by running an initial FastQC analysis. This yielded evidence of weakness in the per-base sequence content and sequence duplication. Trimmomatic was used to remove these low quality reads. [This](https://github.com/dpb85/RNAseq-Project/blob/main/albicans.SBATCH) was the Trimmomatic script used. Note, from here on out, this analysis will focus on the paired end reads. The clean reads can be found in the WTB1_1.trPE.fq.gz and WTB1_2.trPE.fq.gz files.

Errors were initially found for the per-base sequence content, as the machine was still learning to locate the clusters. For this reason, we used headcrop to cut the first 15 bases. High sequence duplication may be due to contamination or due to a gene with high expression. Nevertheless, given that there are 20,000,000 reads, the 500 replicats of one read that was flagged is not of great concern, as it represents a small percentage of the genome.

Fastqc was run through interactive mode. Results of the cleaning [here](https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0) show that per-base sequence content improved.

### Aligning to Reference Genome

The data was aligned to the reference genome sourced from NCBI using [this](https://github.com/dpb85/RNAseq-Project/blob/main/alb_bowtie.SBATCH) script; the reference code is GCA_000182965.3. The gtf file was chosen, as it will prove helpful downstream to use this type of annotation file. Results of the alignment can be found [here](https://docs.google.com/spreadsheets/d/1fa-FXVMlCXOZkbHSx_mMg0OXLMy9BeBJg8uWrEMpKGo/edit?gid=0#gid=0) under the file name WTB1.bam. Few _C. albicans_ genes have introns, so contiguous alignment was used.

### Counting Reads

To count how many reads mapped to each gene, HTseq and [this](https://github.com/dpb85/RNAseq-Project/blob/main/htseq.SBATCH) script were used. The input files were the bam output file of the bowtie alignment and the gtf file pulled from NCBI. The alignments from all six samples of _C. albicans_ were compiled for the HTseq analysis.

## Downstream

### Differential Expression Analysis

Differential gene expression was determined using DEseq2 using [this](https://github.com/dpb85/RNAseq-Project/blob/main/calb_DESeq_script_FINAL.R) script in R. There were 13 genes differentially expressed. Gene names, p-values, and the biological function of the genes can be found [here](https://docs.google.com/spreadsheets/d/1_c6l934VuI1iEprC6hadYm-PaygesRUPCh1upRf_XD8/edit?gid=1743740104#gid=1743740104).
Results of the volcano plot show that there is a statistically significant difference in the gene expression of these genes.
![volcano_TH-vTH+](https://github.com/user-attachments/assets/2a083807-e879-4c09-955b-54efb5f45207)
Results of the PCA plot show that the differences in gene expression are correlated with thiamine presence or absence. 
![TH-vTH+_pcaplot](https://github.com/user-attachments/assets/7661b367-b973-4d73-8bc1-b9a34910fc15)

### Gene Ontology Analysis

Results of a gene ontology enrichment analysis show that the thymine biosynthetic process pathway was significantly upregulated. Four of five genes in the thiamine biosynthetic process were differentially expressed, compared to the 0.01 genes expected by random chance. This constitutes a fold enrichment greater than 100, and a p-value of 6.47^10-11. This result suggests that in the absence of thiamine, it is likely that this pathway is upregulated in order for the organism to create its own thiamine in order to satisfy its thiamine needs.

Though not indicated in the gene ontology enrichment analysis, several transmembrane transport genes were also present in the differentially expressed genes. This may suggest that in a nutrient-deprived environment, the organism has an increased pressure to scavenge its environment for any available resources.

Results of this analysis show significant differential expression in genes due to thiamine presence and absence. The thirteen genes identified as differentially expressed shed light on some of the key components of vitamin metabolism in _C. albicans_.
 
Questions:Add names of intermediate files but don't need to add them yoruself" -- which files?
several timespathway came up, number genex expected, number in our list, fold enrichment, p val, my interpretation of it.
Circle back to og goals
