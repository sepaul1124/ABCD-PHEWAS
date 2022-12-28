traits <- c("cEF.sumstats.gz", "intelligence.sumstats.gz", "eduattain.sumstats.gz")
sample.prev <- c(NA, NA, NA, NA)
population.prev <- c(NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("cEF", "int", "eduattain")
LDSCoutput_COG <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_COG, file = "LDSCoutput_COG.RData")
