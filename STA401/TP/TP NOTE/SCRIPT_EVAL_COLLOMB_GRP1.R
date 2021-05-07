#TP noté 07/05/2021

setwd("~/GitHub/L2_INFO/STA401/TP/TP NOTE")
read.table("DonneesEvalTP2021.txt",header=T,sep="\t",dec=",")->notes

#Exercice 1

x<-notes[notes$GTD == 1,"CC1"]
y<-notes[notes$GTD == 1,"CC2"]
z<-x< 8
z

mean(x)
sd(x)

mean(y)
sd(y)

mean(z)
sd(z)

table(z)["TRUE"]

prop.test(table(z)["TRUE"],length(z), NULL, conf.level = 0.99, correct = T)
