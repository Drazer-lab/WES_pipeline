#!/bin/bash
#PBS -N Variant_call
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=80gb
#PBS -o /your_path/log.varcal.out
#PBS -e /your_path/log.varcal.err

module load java-jdk/1.8.0_92
module load gatk/3.7
echo START

java -jar /apps/software/java-jdk-1.8.0_92/gatk/3.7/GenomeAnalysisTK.jar -T HaplotypeCaller -R /your_path/sources_hg38/resources-broad-hg38-v0-Homo_sapiens_assembly38.fasta -I /your_path/yours.bam --genotyping_mode DISCOVERY -o /your_path/yours.vcf

echo END
