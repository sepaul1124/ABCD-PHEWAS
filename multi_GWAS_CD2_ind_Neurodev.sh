#!/bin/bash
#SBATCH -J multi-GWAS_CD_Ind_Neur
#SBATCH --mem=4G
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --output=./results_indep/Neurodev/set.%a.out
#SBATCH --error=./results_indep/Neurodev/set.%a.err
#SBATCH --array=0-914

### display time at beginning and end of script to track how long it takes
date
### display node that job was run on
hostname

### set variable that will be the number of the SNP set
cc="${SLURM_ARRAY_TASK_ID}"

### replace "NUMBER" variable in R script with the number of the SNP set the job is running
### you can delete these scripts after you're done with the analyses
sed "s/NUMBER/$cc/g" multi_GWAS_ind_Neurodev.R > ./results_indep/Neurodev/$cc.R

### run the Rscript
eval $( spack load --sh r@4.1.3 )
script ./results_indep/Neurodev/$cc.R

date
