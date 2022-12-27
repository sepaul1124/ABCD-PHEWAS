#!/bin/bash
#SBATCH -J multi-GWAS_CD_Ind_Comp
#SBATCH --mem=4G
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --output=./results_indep/Compulsive/set.%a.out
#SBATCH --error=./results_indep/Compulsive/set.%a.err
#SBATCH --array=0-914

### display time at beginning and end of script to track how long it takes
date
### display node that job was run on
hostname

### set variable that will be the number of the SNP set
cc="${SLURM_ARRAY_TASK_ID}"

### replace "NUMBER" variable in R script with the number of the SNP set the job is running
### you can delete these scripts after you're done with the analyses
sed "s/NUMBER/$cc/g" multi_GWAS_ind_Compulsive.R > ./results_indep/Compulsive/$cc.R

### run the Rscript
eval $( spack load --sh r@4.1.3 )
Rscript ./results_indep/Compulsive/$cc.R

date
