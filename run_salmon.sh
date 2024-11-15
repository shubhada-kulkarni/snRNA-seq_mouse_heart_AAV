#!/bin/bash
#SBATCH --job-name="salmon_count"
#SBATCH --mail-type=END,FAIL,TIME_LIMIT_80
#SBATCH --mail-user=shubhada.kulkarni@uni-heidelberg.de
#SBATCH --error="%x.err.%j"
#SBATCH --output="%x.out.%j"

#
# shell script to create index using Salmon and run quantification on fasta files
#
f1=$1
f2=$2
sample_id=$3

#f1="/prj/julia_ritterhoff/data/fastq/2-1E12_S1_L001_R1_001.fastq.gz"
#f2="/prj/julia_ritterhoff/data/fastq/2-1E12_S1_L001_R2_001.fastq.gz"
#f1="/prj/julia_ritterhoff/data/fastq/test1.gz"
#f2="/prj/julia_ritterhoff/data/fastq/test2.gz"

# running quantification
#
module load salmon

salmon quant -i /prj/julia_ritterhoff/data/database/salmon_AAV -l A -1 $f1 -2 $f2 -p 12 -o "/prj/julia_ritterhoff/data/processed/output_$sample_id"

echo "Done!"
