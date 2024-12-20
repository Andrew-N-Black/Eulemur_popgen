#Below code was to generate and combine summary statistc plots following the sarek pipeline
library(ggplot2)

#Read in data
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")

#Assign factor order
Fecalseq_metadata_v4$Putative_species <- factor(Fecalseq_metadata_v4$Putative_species, levels = c("E_rufifrons","Hybrid", "E_cinereiceps"))

#Breadth
ggplot(data=Fecalseq_metadata_v4, aes(y=Breadth, x=reorder(Sample,Breadth),fill=Putative_species))+geom_bar(stat="identity")+theme_classic()+xlab("Sample (N=49)")+ylab("1x Breadth")+theme( axis.ticks.x=element_blank(),axis.text.x = element_blank())+scale_fill_manual(values=c("#D95F02","#7570B3","#1B9E77"))+theme(legend.title=element_blank())

#Depth
ggplot(data=Fecalseq_metadata_v4, aes(y=Depth, x=reorder(Sample,Depth),fill=Putative_species))+geom_bar(stat="identity")+theme_classic()+xlab("Sample (N=49)")+ylab("Depth of Coverage")+theme( axis.ticks.x=element_blank(),axis.text.x = element_blank())+scale_fill_manual(values=c("#D95F02","#7570B3","#1B9E77"))+theme(legend.title=element_blank())

#Mapping
ggplot(data=Fecalseq_metadata_v4, aes(y=ProperlyPaired, x=reorder(Sample,ProperlyPaired),fill=Putative_species))+geom_bar(stat="identity")+theme_classic()+xlab("Sample (N=49)")+ylab("%Mapped")+theme( axis.ticks.x=element_blank(),axis.text.x = element_blank())+scale_fill_manual(values=c("#D95F02","#7570B3","#1B9E77"))+theme(legend.title=element_blank())
