# WES_pipeline

## Step 1: Generate unmapped BAM from FASTQ

Generate an unmapped BAM from FASTQ
Convert FASTQ to uBAM and add read group information using FastqToSam.
For unmapped BAM files you can assign read groups which let you specify example what platform was used (Sanger, Illumina, Roche 454, IonTorrent, etc) and the sample name (e.g. Cancer vs Healthy). (https://blastedbio.blogspot.co.uk/2011/10/fastq-must-die-long-live-sambam.html )

We are analyzing pair-end whole exome sequencing data. The crucial part for the first step of the pipeline is the file names, which in this case is:
HLMM2BBXX_15607628_S19_L003_R1_001.fastq.gz
HLMM2BBXX_15607628_S19_L003_R2_001.fastq.gz

Where reads for a forward primer are in the R1 file and reads start with the reverse primer should be in R2 file. 

From the file name, we can get information to assign read groups, such as sample name (S19), lane number (3) and platform unit (HLMM2BBXX.3).
Used a “for” loop, which takes each R1 fastq file, combines it with the R2 pair and gives a proper read groups to each pair of fastq files. In this way we don’t have to do it for each fastq pair separately.  




## Step 2: Mark adapter sequences using MarkIlluminaAdapters

MarkIlluminaAdapters adds the XT tag to a read record to mark the 5' start position of the specified adapter sequence and produces a metrics file. Some of the marked adapters come from concatenated adapters that randomly arise from the primordial soup that is a PCR reaction. Others represent read-through to 3' adapter ends of reads and arise from insert sizes that are shorter than the read length.
(https://software.broadinstitute.org/gatk/documentation/article.php?id=6483 ) 

Again we don’t want to mark adapters for each sample separately, so this “for” loop will take each uBAM file created in previous step and run MarkIlluminaAdapters for it. 


