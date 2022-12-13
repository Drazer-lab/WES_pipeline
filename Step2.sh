#!/bin/bash
#PBS -N step2
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=40gb
#PBS -o /scratch/username/your_path/log.step2.out
#PBS -e /scratch/username/your_path/log.step2.err

module load java-jdk/1.8.0_92
module load picard/2.8.1

for input in `ls /scratch/***/*_ubam.bam`; do java -
Djava.io.tmpdir=${input%_ubam.bam}"_tmp_step2" -jar /apps/software/java-jdk-
1.8.0_92/picard/2.8.1/picard.jar MarkIlluminaAdapters I=$input
O=${input%_ubam.bam}"_step2.bam" M=${input%_ubam.bam}"_step2_metrics.txt" ;done
echo END
