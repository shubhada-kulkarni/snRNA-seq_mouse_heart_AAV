#!/bin/bash
#SBATCH --job-name="cranger_count"
#SBATCH --mail-type=END,FAIL,TIME_LIMIT_80
#SBATCH --mail-user=shubhada.kulkarni@uni-heidelberg.de
#SBATCH --error="%x.err.%j"
#SBATCH --output="%x.out.%j"
#
#
# shell  script to submit mapping jobs using  cellranger
#
#
sampleid=$1

#transcriptome="/prj/julia_ritterhoff/data/database/GRCm38_102_AAV_short"
transcriptome="/prj/julia_ritterhoff/data/database/GRCm38_102_AAV"
fastq_path="/prj/julia_ritterhoff/data/fastq/"

echo "Starting the mapping"

cd /prj/julia_ritterhoff/data/processed/

if [ -d "$sampleid" ]; then
  echo "$sampleid does exist. Deleting!"
  rm -rf $sampleid
fi

/prj/julia_ritterhoff/installations/cellranger/cellranger-8.0.1/cellranger count --id=$sampleid --transcriptome=$transcriptome --fastqs=$fastq_path --sample=$sampleid --create-bam true --nosecondary

# /prj/julia_ritterhoff/installations/cellranger/cellranger-8.0.1/cellranger count --id="test" --transcriptome=/prj/julia_ritterhoff/scripts/GRCm38_102_AAV_short/ --fastqs=/prj/julia_ritterhoff/data/fastq/ --sample="test" --create-bam true --nosecondary

echo "Done!"
