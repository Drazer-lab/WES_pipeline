#!/bin/bash
#PBS -N BWA_MEM_3a
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=128gb
#PBS -o /your_path/log.BWA_MEM_3a.out
#PBS -e /log.BWA_MEM_3a.err

module load java-jdk/1.8.0_92
module load picard/2.8.1

for input in `ls /your_path/*MarkIlluminaAdapters.bam`; do java -Djava.io.tmpdir=${input%_MarkIlluminaAdapters.bam}"_tmp_step3a_BWA" -jar /apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar SamToFastq I=$input FASTQ=${input%_MarkIlluminaAdapters.bam}"_3a_forBWA.fastq" CLIPPING_ATTRIBUTE=XT CLIPPING_ACTION=2 INTERLEAVE=true NON_PF=true; done

echo END
