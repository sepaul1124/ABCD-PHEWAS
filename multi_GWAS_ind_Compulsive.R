### load necessary packages
library(devtools)
require(GenomicSEM)
library(dplyr)

### load the summary statistics RData file in the split form
print("loading summary statistics from set NUMBER...")
split_sumstats <- read.table("./split_sumstats/split_sumstats3/sumstatsNUMBER.txt", header = TRUE)
print("finished loading summary statistics from set NUMBER")

### load the LDSC covariance matrix
print("loading LDSC covariance matrix...")
load("LDSCoutput_CD.RData")
print("finished loading LDSC covariance matrix")

### identify model
print("running models...")
Ind_Compulsive_Mod <-'Compulsive =~ an + 1*ocd + ts
        Psychotic =~ scz + 1*bip + pau
        Neurodev =~ 1*adhd + asd + ptsd + ts + pau
        Internal =~ 1*mdd + gad + ptsd + pau

Compulsive ~~ Psychotic
Compulsive ~~ 0*Neurodev
Compulsive ~~ Internal
Psychotic ~~ Neurodev
Psychotic ~~ Internal
Neurodev ~~ Internal
  
Compulsive ~~ NA*Compulsive
Psychotic ~~ NA*Psychotic
Neurodev ~~ NA*Neurodev
Internal ~~ NA*Internal

an ~~ a*an
a > 0.001
ocd ~~ b*ocd
b > 0.001
ts ~~ c*ts
c > 0.001
scz ~~ d*scz
d > 0.001
bip ~~ e*bip
e > 0.001
pau ~~ f*pau
f > 0.001
adhd ~~ g*adhd
g > 0.001
asd ~~ h*asd
h > 0.001
mdd ~~ i*mdd
i > 0.001
gad ~~ j*gad
j > 0.001
ptsd ~~ k*ptsd
k > 0.001

an ~ SNP
ocd ~ SNP
ts ~ SNP
Internal ~ SNP
Psychotic ~ SNP
Neurodev ~ SNP'

### run a user model for one subset of SNPs for Compulsive
Ind_Compulsive <- userGWAS(covstruc = LDSCoutput_CD, SNPs = split_sumstats, model = Ind_Compulsive_Mod, 
                           parallel = TRUE, cores = 6,
                           sub=c("an~SNP", "ocd~SNP", "ts~SNP", "Internal~SNP", "Psychotic~SNP", "Neurodev~SNP"))
print("Ind Compulsive GWAS completed")

print("printing factor 1 SNPs")
CF1 <- Ind_Compulsive[[1]]
write.csv(CF1, file="./results_indep/Compulsive/F1_sumstats/NUMBER.csv", row.names=FALSE)

print("printing factor 2 SNPs")
CF2 <- Ind_Compulsive[[2]]
write.csv(CF2, file="./results_indep/Compulsive/F2_sumstats/NUMBER.csv", row.names=FALSE)

print("printing factor 3 SNPs")
CF3 <- Ind_Compulsive[[3]]
write.csv(CF3, file="./results_indep/Compulsive/F3_sumstats/NUMBER.csv", row.names=FALSE)


