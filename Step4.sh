#!/bin/bash
#PBS -N Duplicates
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=128gb
#PBS -o /your_path/log.MarkDuplicates.out
#PBS -e /your_path/log.MarkDuplicates.err

module load java-jdk/1.8.0_92
module load picard/2.8.1

for input in `ls /your_path/*_L002_mapped.bam`; do java -Djava.io.tmpdir=${input%_L002_mapped.bam}"_tmp_step4" -jar /apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar MarkDuplicates INPUT=$input INPUT=${input%_L002_mapped.bam}"_L003_mapped.bam" OUTPUT=${input%_L002_mapped.bam}"_markduplicates.bam" METRICS_FILE=${input%_L002_mapped.bam}"_markduplicates_metrics.txt" OPTICAL_DUPLICATE_PIXEL_DISTANCE=2500 CREATE_INDEX=true ; done

echo END
