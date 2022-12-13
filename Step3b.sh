#!/bin/bash
#PBS -N BWA_MEM
#PBS -S /bin/bash
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=180gb
#PBS -o /your_path/log.BWA_MEM_3b.out
#PBS -e /your_path/log.BWA_MEM_3b.err

module load gcc/6.2.0
module load java-jdk/1.8.0_92
module load bwa/0.7.15

for input in `ls /your_path/*_3a_forBWA.fastq`; do /apps/software/gcc-6.2.0/bwa/0.7.15/bwa mem -M -t 7 -p /your_path/sources_hg38/resources-broad-hg38-v0-Homo_sapiens_assembly38.fasta $input > ${input%_3a_forBWA.fastq}"_bwa_mem.sam" ; done
echo END
