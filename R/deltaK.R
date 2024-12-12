library(ggplot2)

delta_lemur <- read.csv("~/delta_lemur.txt", sep="")
ggplot(delta_lemur,aes(x=K,y=Delta))+geom_line(color="black") + geom_point(color="grey22",size=6)+theme_classic()+ylab("∆K")
ggsave("lemur_deltaK.svg")
