#!/bin/bash
#PBS -N Step1
#PBS -S /bin/bash
#PBS -l walltime=96:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=40gb
#PBS -o /scratch/username/your_path/log.step1.out
#PBS -e /scratch/username/your_path/log.step1.err


module load java-jdk/1.8.0_92
module load picard/2.8.1

echo START

for input in `ls /scratch/***/*_L004_R1_001.fastq.gz`; do platform_unit=("`zless $input |head -n1 |
awk -F ':' '{print $3 "." $4}'`"); java -Djava.io.tmpdir=${input%_R1_001.fastq.gz}"_001_tmp" - jar
/apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar FastqToSam FASTQ=$input
FASTQ2=${input%_R1_001.fastq.gz}"_R2_001.fastq.gz"
OUTPUT=${input%_R1_001.fastq.gz}"_ubam.bam" READ_GROUP_NAME=***
SAMPLE_NAME=*** LIBRARY_NAME=L1 PLATFORM_UNIT=$platform_unit
PLATFORM=illumina ;done

echo END
