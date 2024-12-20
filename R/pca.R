library(ggplot2)
library(RColorBrewer)

#Read in metadata for n=49
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
#Import covariation matrix
cov<-as.matrix(read.table("revisedMin3Maf025.cov"))
#Extract eigenvalues
axes<-eigen(cov)
#Calculate percent variation for the first six axes for plotting purposes
head(axes$values/sum(axes$values)*100)
#33.874446  7.842208  2.543997  2.398927  2.329802  2.281435

#Extract the first three axes
PC1_3<-as.data.frame(axes$vectors[,1:3])

#Plot using ggplot2
ggplot(data=PC1_3, aes(y=V2, x=V1))+geom_point(size=5,pch=21,aes(fill=Fecalseq_metadata_v4$Putative_species))+ theme_classic(base_size = 14) + xlab("PC1 (33.8%)") +ylab("PC2 (7.8%)")+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed") + scale_fill_brewer(palette="Dark2")+theme(legend.title=element_blank())
ggsave("~/pca.lemur49.svg")

#Read in metadata for n=46
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4B.csv")
#Import covariation matrix
cov<-as.matrix(read.table("revisedMin3Maf025Sub.cov"))
#Extract eigenvalues
axes<-eigen(cov)
#Calculate percent variation for the first six axes for plotting purposes
head(axes$values/sum(axes$values)*100)
#[1] 16.563829 12.160455  3.047272  2.954952  2.787986

#Extract the first three axes
PC1_3<-as.data.frame(axes$vectors[,1:3])

#Plot using ggplot2
ggplot(data=PC1_3, aes(y=V2, x=V1))+geom_point(size=5,pch=21,aes(fill=Fecalseq_metadata_v4$Putative_species))+ theme_classic(base_size = 14) + xlab("PC1 (16.5%)") +ylab("PC2 (12.1%)")+geom_hline(yintercept=0,linetype="dashed")+geom_vline(xintercept =0,linetype="dashed") + scale_fill_brewer(palette="Dark2")+theme(legend.title=element_blank())
ggsave("~/pca.lemur46.svg")

