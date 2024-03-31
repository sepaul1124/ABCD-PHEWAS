require(GenomicSEM)
cross_disorder_munge <- munge(c("adhd_eur_jun2017.txt", "ASD.txt", "dbGAP_GAD2eur.txt", "ocd_aug2017.txt", "PAU.txt", "pgc_AN2_2.txt", 
                                "pgc_BIP.txt", "PGC_UKB_depression_genome-wide.txt", "PTSD_freeze2.txt", "SCZ3.txt", "TS.txt"), 
                             hm3 = "w_hm3.snplist",
                             trait.names=c("adhd", "asd", "gad", "ocd", "pau", "an", 
                                           "bip", "mdd", "ptsd", "scz", "ts"), 
                             N= c(49735.8584, 43777.8191, 175163, 7281.30679, 435563, 46321.9, 
                                  101962.957, 449149.997, 70332.2147, 157013.0008, 12140.0276), 
                             info.filter = 0.9, maf.filter = 0.01)

save(cross_disorder_munge, file = "cross_disorder_munge.Rdata")

