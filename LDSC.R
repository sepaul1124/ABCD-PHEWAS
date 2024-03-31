traits <- c("adhd.sumstats.gz", "asd.sumstats.gz", "gad.sumstats.gz", "ocd.sumstats.gz", "pau.sumstats.gz", "an.sumstats.gz", 
            "bip.sumstats.gz", "mdd.sumstats.gz", "ptsd.sumstats.gz", "scz.sumstats.gz", "ts.sumstats.gz")
sample.prev <- c(.5, .5, NA, .5, NA, .5, 
                 .5, .5, .5, .5, .5)
population.prev <- c(.03, .006, NA, .01, NA, .002, 
                     .01, .16, .08, .01, .01)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("adhd", "asd", "gad", "ocd", "pau", "an", 
                 "bip", "mdd", "ptsd", "scz", "ts")
LDSCoutput_CD <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_CD, file = "LDSCoutput_CD.RData")
