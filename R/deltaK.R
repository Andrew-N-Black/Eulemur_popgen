library(ggplot2)
#Delta K values were obtained from the following web server: https://clumpak.tau.ac.il/ and added to a text file:
delta_lemur <- read.csv("~/delta_lemur.txt", sep="")
#And plotted using the following command
ggplot(delta_lemur,aes(x=K,y=delta))+geom_line(color="black") + geom_point(color="grey22",size=6)+theme_classic()+ylab("∆K")
ggsave("~/lemur_deltaK.svg")
