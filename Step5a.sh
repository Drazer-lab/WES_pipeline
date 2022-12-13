#!/bin/bash
#PBS -N BaseRecalibrator
#PBS -S /bin/bash
#PBS -l walltime=122:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=128gb
#PBS -o /your_path/log.BaseRecalibrator.out
#PBS -e /your_path/log.BaseRecalibrator.err

module load java-jdk/1.8.0_92
module load gatk/3.7

echo START

for input in `ls /your_path/*_markduplicates.bam`; do java -jar /apps/software/java-jdk-1.8.0_92/gatk/3.7/GenomeAnalysisTK.jar -T BaseRecalibrator -R /your_path/sources_hg38/resources-broad-hg38-v0-Homo_sapiens_assembly38.fasta -I $input -knownSites /your_path/sources_hg38/resources-broad-hg38-v0-Homo_sapiens_assembly38.dbsnp138.vcf -o ${input%_markduplicates.bam}"_BaseRecalibrator.table"; done

echo END
