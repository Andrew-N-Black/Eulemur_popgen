library(pophelper)
library(RColorBrewer)

setwd("~/DL_R3/")
brewer.pal(n=5,"Dark2")
[1] "#1B9E77" "#D95F02" "#7570B3" "#E7298A" "#66A61E"

#Load in merged Q matrices (from CLUMPP) for K2-K4
slist<-readQ(files =c("lemur.K2","lemur.K3","lemur.K4","lemur.K5"))
#Load in metadata for sorting based upon latitude and presumed species identity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4B.csv") #for n=46
#Extract the column with latitude first, then presumed species identity
both <- as.data.frame(Fecalseq_metadata_v4[,c(8,10)])
#Convert latitude to character to make pophelper happy
both$Lat<-as.character(both$Lat)
#Generate plot
plotQ(slist,returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("#1B9E77","#D95F02","#7570B3","#E7298A","#66A61E"),grplab=as.data.frame(both),ordergrp=T,showlegend=F,height=1,indlabsize=1.8,indlabheight=0.08,indlabspacer=0,barbordercolour="black",divsize = 0.0,grplabsize=0.6,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="admixure_lemur",imgtype="pdf",exportpath=getwd(),divcol = "black",splabcol="black",grplabheight=0,grplabangle =45)
