setwd("~/L2 INFO/STA401/TP")

#Exercice 1
#1)
mtcars

#2)
names(mtcars)

#3)
head(mtcars)

#4)
summary(mtcars)

#Exercice 2
#1)
mtcars$mpg -> mpg
mpg
mtcars$disp -> disp
mtcars$cyl -> cyl
mtcars$am -> am

#2)
boxplot(mpg,main = "distance en milles parcourue par gallon ",ylab = "miles")
abline(h = median(mpg), col = "red")

#3)
selection <- am == 0
mtcars[selection,"mpg"]

mpga = mtcars[am == 0, "mpg"]
mpgm = mtcars[am == 1, "mpg"]

boxplot(mpga,mpgm,names = c("automatique", "manuelle"), main = "mpg selon la transmission")

#Exercice 3
#1)
table(am)/sum(table(am))
table(am)/length(am)

prop.table(am)
freq = prop.table(table(am))

#2)
pie(table(am))
pie(freq)

barplot(table(am))
barplot(freq)

#3)
par(mfrow = c(1,2))
pie(freq)
barplot(freq)

#4)
vs <- mtcars$vs
table(am,vs)
table(am,vs)/sum(table(am,vs))
table(am,vs)

prop1 = prop.table(table(am,vs),1)
barplot(prop1,beside = F)

prop2 = prop.table(table(am,vs),2)
barplot(prop2,beside = F)

#Exercice 4
#1)
cyl <- mtcars$cyl

#2)
s = sum(cyl)
s2 = sum(cyl^2)
moyenne = s/length(cyl)
variance = s2/length(cyl)-moyenne

#-----------------------------------------------------------
#Exemple colle serie 1 exo 2
#1)
#méthode 1
curve(log(x), from = 0.1, to = 5,n = 51, asp=1, ylim = c(-2.5,5.5))

#méthode 2
x = seq(0.1,5,0.1)
plot(x,log(x), type = "l", asp = 1, ylim = c(-2.5,5.5))

#2)
curve(exp(x), from=0.1, to=5,n=51,add=TRUE, col="red")
abline(0, 1, col="green", add= TRUE)
#-----------------------------------------------------------

#3)
mean(cyl)
var(cyl)
variance*length(cyl)/(length(cyl)-1)

quantile(cyl,c(0,0.33,0.44,0.80,1))

#4)
mean(mpg)
sd(mpg)
mean(disp)
sd(disp)

#Exercice 5
#1)
pie(cyl)
table(cyl)
pie(table(cyl))
pie(prop.table(table(cyl)))
barplot(table(cyl))
barplot(prop.table(table(cyl)))

#2) données continues
par(mfrow = c(1,1))
hist(disp, probability = TRUE)

#3)
curve(dnorm(x,mean(disp),mean(disp)),col = "red", add=T)

#4)
hist(mpg,probability=T)
curve(dnorm(x,mean(mpg),sd(mpg)),col="red", add=T)

#5)
par(mfrow=c(1,2))
hist(disp,probability = T)
curve(dnorm(x,mean(disp),sd(disp)),col="red", add=T)

hist(mpg,probability = T)
curve(dnorm(x,mean(mpg),sd(mpg)),col="red", add=T)
