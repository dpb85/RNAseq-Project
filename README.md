# conservation-bio

This project will focuse on the "B" biological replicate of _Candida albicans_. Specifically, this project will analyze the Thi+ version of this replicate; that is, WTB1.  

First quality control was run on the raw data files (WTB1_1.fq.gz and WTB1_2.fq.gz) by running an initial FastQC analysis. This yielded evidence of weakness in the per-base sequence content and sequence duplication, as seen in filees WTB1_1_fastqc.html and WTB1_2_fastqc.html.

Using the albicans.SBATCH script, the raw data files were processed using Trimmomatic. This eliminated the weaknesses of the raw data files in the PE files, as seen in files ___ and ___.
