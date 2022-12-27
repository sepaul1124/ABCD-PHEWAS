require(GenomicSEM)

N= c(49735.8584, 43777.8191, 175163, 7281.30679, 435563, 46321.9, 101962.957, 449149.997, 70332.2147, 157013.0008, 12140.0276)

se.logit <- c(F,F,F,F,F,T,T,F,F,F,F)

files <- list("adhd_eur_jun2017.txt", "ASD.txt", "dbGAP_GAD2eur.txt", "ocd_aug2017.txt", "PAU.txt", "pgc_AN2_2.txt", "pgc_BIP.txt", "PGC_UKB_depression_genome-wide.txt", "PTSD_freeze2.txt", "SCZ3.txt", "TS.txt")

ref <- "reference.1000G.maf.0.005.txt"

OLS <- c(F,F,T,F,T,F,F,F,F,F,F)



CD_sumstats <- sumstats(files=files,ref=ref,trait.names=c("adhd", "asd", "gad", "ocd", "pau", "an", "bip", "mdd", "ptsd", "scz", "ts"),se.logit=se.logit,OLS = OLS,linprob=NULL,prop=prop, info.filter=.6, maf.filter=0.01,keep.indel=FALSE,parallel=FALSE,cores=NULL)

save(CD_sumstats, file="CD_sumstats.RData")

