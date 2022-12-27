#!/bin/bash
#SBATCH --array=1-22
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10G
#SBATCH --job-name=ABCD_PRScs_Internal_GSEM
#SBATCH --output=./PRScs_Output/PRScsInt-chr%a.out
#SBATCH --error=./PRScs_Output/PRScsInt-chr%a.err

workdir=/scratch/aalab/Sarah/GSEM_sumstats

## cd to working directory

cd ${workdir}

eval `spack load --sh python`

/ref/aalab/software/PRScs/PRScs.py --ref_dir=ldblk_1kg_eur --bim_prefix=abcd3_eur_filtered_nodups_rsid_maf01 \
				    --chrom=${SLURM_ARRAY_TASK_ID} --sst_file=Internal_noQ_forPRScs.txt\
				    --n_gwas=429901 --out_dir=PRScs_Output/ABCD_EUR_Internal_Factor_auto.chr${SLURM_ARRAY_TASK_ID}
