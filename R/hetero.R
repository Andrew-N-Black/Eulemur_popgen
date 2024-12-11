

library(ggplot2)
library(RColorBrewer)

#Read in metadata with individual heterozygosity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
Fecalseq_metadata_v4$Putative_species <- factor(Fecalseq_metadata_v4$Putative_species, levels = c("E_rufifrons","Hybrid", "E_cinereiceps"))

#Color by region
ggplot(Fecalseq_metadata_v4,aes(x=Putative_species,y=H,fill=Putative_species))+geom_boxplot(show.legend =FALSE)+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+theme_classic()+scale_fill_manual(values=c("orchid","dodgerblue2","yellow"))+theme(legend.position="none")
