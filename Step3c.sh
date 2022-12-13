#!/bin/bash
#PBS -N BWA_MEM_3c
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=128gb
#PBS -o /your_path/log.BWA_MEM_3c.out
#PBS -e /your_path/log.BWA_MEM_3c.err

module load java-jdk/1.8.0_92
module load picard/2.8.1

for input in `ls /your_path/*_bwa_mem.sam`; do java -Djava.io.tmpdir=${input%_bwa_mem.sam}"_tmp_step3c_BWA" -jar /apps/software/java-jdk-1.8.0_92/picard/2.8.1/picard.jar MergeBamAlignment R= /your_path/sources_hg38/resources-broad-hg38-v0-Homo_sapiens_assembly38.fasta ALIGNED_BAM=$input UNMAPPED_BAM=${input%_bwa_mem.sam}"ubam.bam" OUTPUT=${input%_bwa_mem.sam}"_mapped.bam" CREATE_INDEX=true ADD_MATE_CIGAR=true CLIP_ADAPTERS=false CLIP_OVERLAPPING_READS=true INCLUDE_SECONDARY_ALIGNMENTS=true MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS ; done
echo END
