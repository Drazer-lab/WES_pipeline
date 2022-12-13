#!/bin/bash
#PBS -N Adapters
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=256gb
#PBS -o /your_path/log.MarkIlluminaAdapters.out
#PBS -e /your_path/log.MarkIlluminaAdapters.err

module load java-jdk/1.8.0_92
module load picard/2.8.1

for input in `ls /your_path/*ubam.bam`; do java -Djava.io.tmpdir=${input%ubam.bam}"_tmp_step2" -jar /apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar MarkIlluminaAdapters I=$input O=${input%ubam.bam}"_MarkIlluminaAdapters.bam" M=${input%ubam.bam}"_MarkIlluminaAdapters_metrics.txt" ;done

echo END
