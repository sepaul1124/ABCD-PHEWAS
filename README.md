# ABCD-PHEWAS
GitHub Repository for ABCD PRS-PheWAS

## File names + Descriptions

cross_disorder_munge.sh   
cross_disorder_munge.R   
    These files contain code to munge the GWAS summary statistics used in Genomic SEM. The .sh script is used to run the .R script. 

CD_sumstats.R  
    This script prepares the summary statistics for GWAS, including coding alleles to have the same reference allele across phenotypes and scaling coefficients and standard errors. 

LDSC.R   
    This script computes the genetic covariance matrix among the 11 psychiatric phenotypes.
    
multi_GWAS_CD2.sh  
multi_GWAS_CD2.R  
    These files contain code to conduct the multivariate GWAS. The summary statistics generated from the CD_sumstats.R script are loaded into R along with the LDSC covariance matrix. A correlated factors model is specified, including SNP effects. 
  
multi_GWAS_CD2_ind_Compulsive.sh  
multi_GWAS_ind_Compulsive.R  
    These files contain code to conduct a multivariate GWAS in which the SNP operates entirely through the Compulsive Factor indicators.
  
multi_GWAS_CD2_ind_Psychotic.sh  
multi_GWAS_ind_Psychotic.R  
    These files contain code to conduct a multivariate GWAS in which the SNP operates entirely through the Psychotic Factor indicators.
  
multi_GWAS_CD2_ind_Neurodev.sh  
multi_GWAS_ind_Neurodev.R  
    These files contain code to conduct a multivariate GWAS in which the SNP operates entirely through the Neurodevelopmental Factor indicators.
  
multi_GWAS_CD2_ind_Internal.sh  
multi_GWAS_ind_Internal.R  
    These files contain code to conduct a multivariate GWAS in which the SNP operates entirely through the Internalizing Factor indicators.
    
PheWAS Analyses Final5.Rmd  
    This R markdown file contains the code used to conduct the PRS-PheWAS analyses and generate figures.
