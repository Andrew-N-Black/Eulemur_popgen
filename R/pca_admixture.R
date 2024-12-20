library(RColorBrewer)
library(pophelper)

brewer.pal(n=5,"Dark2")
# [1] "#1B9E77" "#D95F02" "#7570B3" "#E7298A" "#66A61E"

#Reduced dataset (n=46)
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4B.csv")
slist<-readQ(files ="revisedMin3Maf025Sub.admix.3.Q")
both <- as.data.frame(Fecalseq_metadata_v4[,c(8,10)])
both$Lat<-as.character(both$Lat)
plotQ(slist,returnplot=T,exportplot=T,clustercol=c("#D95F02","#1B9E77","#7570B3"),grplab=as.data.frame(both),ordergrp=T,showlegend=F,height=3,indlabsize=1.8,indlabheight=0.08,indlabspacer=0,barbordercolour="black",divsize = 0.0,grplabsize=0.6,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="plotq",imgtype="pdf",exportpath=getwd(),divcol = "black",splabcol="black",grplabheight=0,grplabangle =45)
             
#Full Dataset (n=49)
Fecalseq_metadata_v4 <- read.csv("~/Fecalseq_metadata_v4.csv")
slist<-readQ(files ="revisedMin3Maf025.admix.3.Q")
both <- as.data.frame(Fecalseq_metadata_v4[,c(8,10)])
both$Lat<-as.character(both$Lat)
plotQ(slist,returnplot=T,exportplot=T,clustercol=c("#7570B3","#1B9E77","#D95F02"),grplab=as.data.frame(both),ordergrp=T,showlegend=F,height=3,indlabsize=1.8,indlabheight=0.08,indlabspacer=0,barbordercolour="black",divsize = 0.0,grplabsize=0.6,barbordersize=0,linesize=0.4,showsp = T,splabsize = 0,outputfilename="plotq",imgtype="pdf",exportpath=getwd(),divcol = "black",splabcol="black",grplabheight=0,grplabangle =45)
