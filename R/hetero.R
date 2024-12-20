library(ggplot2)

#Full Dataset (n=49)
#Read in metadata with individual heterozygosity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
#Change the order of groups before plotting
Fecalseq_metadata_v4$Putative_species <- factor(Fecalseq_metadata_v4$Putative_species, levels = c("E_rufifrons","Hybrid", "E_cinereiceps"))

#Color by putative species identity
ggplot(Fecalseq_metadata_v4,aes(x=Putative_species,y=H,fill=Putative_species))+geom_boxplot(show.legend =FALSE)+xlab("")+ylab("Individual Heterozygosity")+theme_classic(base_size = 12)+scale_fill_manual(values=c("#D95F02","#7570B3","#1B9E77"))+theme(legend.position="none")

#Reduced Dataset (n=46)
#Read in metadata with individual heterozygosity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4B.csv")
#Change the order of groups before plotting
Fecalseq_metadata_v4$Putative_species <- factor(Fecalseq_metadata_v4$Putative_species, levels = c("E_rufifrons","Hybrid", "E_cinereiceps"))

#Color by putative species identity
ggplot(Fecalseq_metadata_v4,aes(x=Putative_species,y=H,fill=Putative_species))+geom_boxplot(show.legend =FALSE)+xlab("")+ylab("Individual Heterozygosity")+theme_classic(base_size = 12)+scale_fill_manual(values=c("#D95F02","#7570B3","#1B9E77"))+theme(legend.position="none")
