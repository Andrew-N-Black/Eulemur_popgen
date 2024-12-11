
library(ggplot2)
library(RColorBrewer)

#Read in metadata
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
#Set factor
#sample_pop_sites$Pop <- factor(sample_pop_sites$Pop, levels = c("OREG","CCAL", "INYO","SCAL"))
cov<-as.matrix(read.table("revised.cov"))
axes<-eigen(cov)
head(axes$values/sum(axes$values)*100)
[1] 33.750273  6.073139  2.713775  2.577800  2.459278  2.393372

PC1_3<-as.data.frame(axes$vectors[,1:3])
title1<-"Locality"
title2<-"Assumed Ancestry"

#By Population
ggplot(data=PC1_3, aes(y=V2, x=V1))+geom_point(size=5,pch=21,aes(fill=Fecalseq_metadata_v4$Putative_species))+ theme_classic() + xlab("PC1 (33.75%)") +ylab("PC2 (6.07%)")+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed")+ scale_fill_brewer(palette="Paired")+theme(legend.title=element_blank())
ggsave("~/pca.lemur.svg")
