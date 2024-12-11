

library(ggplot2)
library(RColorBrewer)

#Read in metadata with individual heterozygosity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
#het$Pop <- factor(het$Pop, levels = c("OREG","CCAL", "INYO","SCAL"))

#Color by region
ggplot(het,aes(x=Pop,y=HET,fill=Pop))+geom_boxplot(show.legend =FALSE)+xlab("")+ylab("Individual Heterozygosity")+theme_classic()+theme_classic()+scale_fill_manual(values=c("darkorchid","tan2","black","cadetblue"))+theme(legend.position="none")+ scale_fill_brewer(palette="Paired")
