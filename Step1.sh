#!/bin/bash
#PBS -N FastqToSam       
#PBS -S /bin/bash
#PBS -l walltime=48:00:00  
#PBS -l nodes=1:ppn=4
#PBS -l mem=256gb     
#PBS -o /your_path/log.fastqToSam.out 
#PBS -e /your_path/log.fastqToSam.err 


module load java-jdk/1.8.0_92  
module load picard/2.8.1

for input in `ls /your_path /*_R1_001.fastq.gz`; do 
sample_name=("`echo $input | awk -F"_" '{print $3}'`"); line_number=("`echo $input | grep  -oP '(?<=L00)\d+(?=\_)'`"); 
java -Djava.io.tmpdir=${input%_R1_001.fastq.gz}"_tmp" -jar /apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar FastqToSam FASTQ=$input FASTQ2=${input%_R1_001.fastq.gz}"_R2_001.fastq.gz" 
OUTPUT=${input%_R1_001.fastq.gz}"ubam.bam" READ_GROUP_NAME=HLMM2BBXX SAMPLE_NAME=$sample_name LIBRARY_NAME=L1 PLATFORM_UNIT=HLMM2BBXX.$line_number PLATFORM=illumina ;done

echo END
