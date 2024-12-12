library(pophelper)
#Load in merged Q matrices (from CLUMPP) for K2-K4
slist<-readQ(files =c("lemur.K2","lemur.K3","lemur.K4"))
#Load in metadata for sorting based upon latitude and presumed species identity
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
#Extract the column with latitude first, then presumed species identity
both <- as.data.frame(Fecalseq_metadata_v4[,c(8,10)])
#Convert latitude to character to make pophelper happy
both$Lat<-as.character(both$Lat)
#Generate plot
plotQ(slist[1:3],returnplot=T,exportplot=T,imgoutput = "join",clustercol=c("dodgerblue2","orchid","yellow","cyan"),grplab=as.data.frame(both),ordergrp=T,showlegend=F,height=1,indlabsize=1.8,indlabheight=0.08,indlabspacer=0,barbordercolour="black",divsize = 0.0,grplabsize=0.6,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="plotq",imgtype="pdf",exportpath=getwd(),splab = c("K=2","K=3","K=4"),divcol = "black",splabcol="black",grplabheight=0,grplabangle =45)
