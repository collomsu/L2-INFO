#---------------------SUJET 1---------------------
#1)
cyl <- mtcars$cyl
mpg <- mtcars$mpg
length(mpg)

M <- matrix(c(mpg,cyl), ncol=2, byrow=F)
m4 <- which(M[,2] == 4)
m6 <- which(M[,2] == 6)
m8 <- which(M[,2] == 8)
par(mfrow=c(1,1))
boxplot(M[m4],M[m6],M[m8],names=c(4,6,8),main = "Indicateur de consommation selon le nombre de cylindres",ylab = "indicateur de consommation", xlab="nombre de cylindre")
m4
moy4 <- mean(M[m4])
moy6 <- mean(M[m6])               
moy8 <- mean(M[m8])

abline(h=moy4)
abline(h=moy6)
abline(h=moy8)

#2)
#Plus on a de cylindre, moins la consommation sera grande.

#---------------------SUJET 2---------------------
#1)
boxplot(mtcars$mpg~mtcars$carb,main = "Indicateur de consommation selon le nombre de carburateurs",ylab = "indicateur de consommation", xlab="nombre de carburateurs")
M <- matrix(c(mtcars$mpg,mtcars$carb), ncol=2, byrow=F)
abline(h=mean(M[which(M[,2] == 1)]))
abline(h=mean(M[which(M[,2] == 2)]))
abline(h=mean(M[which(M[,2] == 3)]))
abline(h=mean(M[which(M[,2] == 4)]))
abline(h=mean(M[which(M[,2] == 6)]))
abline(h=mean(M[which(M[,2] == 8)]))

#2)
#Non ils ne me semblent pas représentatif car ils représentent à chaque fois une seule valeur.
#Que le nombre de carburateur à un effet sur la consommation des véhicules.
#L'écart entre les moyennes de l'échantillon à 2 carburateurs et celui à 4 carburateurs est significatif.

#---------------------SUJET 3---------------------
#1)
#Mpg représente la consommation en Miles/gallon, et wt représente le poids en tonnes.
par(mfrow=c(1,1))
plot(mtcars$wt, mtcars$mpg, type = "p", main="Graphique de la consommation en fonction du poids du véhicule", xlab="poids (en tonnes)", ylab="consommation (en Miles/gallion)")
abline(lm(mtcars$mpg~mtcars$wt)$coefficients, col="red")

#2)
#En regardant le graphique, on peut difficilement dire qu'il n'a pas de lien entre la consommation etle poids du véhicule.
#La droite des moindres carrés en rouge nous montre bien que plus leurs poids est élevé, plus leurs consommation sera moindre.

#---------------------SUJET 4---------------------
#1)
hist(mtcars$qsec, main="Histogramme de l'échantillon qsec")
abline(v=mean(mtcars$qsec), col="red")
abline(v=median(mtcars$qsec), col="green")


#2)
curve(dnorm(x,mean(mtcars$qsec),sd(mtcars$qsec)),col = "red", add=T)
#La plupart des voitures dans cet échantillon mettent environ 18sec à parcourir 400m

#---------------------SUJET 5---------------------
#1)
t <- table(mtcars$gear,mtcars$am)
prop.table(t)

#2)
barplot(t,xlab = "Transmission (0 = auto, 1 = manuel")
#Non elles ne sont pas indépendantes, on voit bien une corrélation entre le mode de transmissions et le nombre de vitesses
# sur un véhicule. Si celui-ci est en automatique il aura alors plus de vitesses qu'une voiture en mode de transmission manuel.

#---------------------SUJET 6---------------------
#1)
install.packages("dplyr")
library("dplyr")
#La variable carb indique le nombre de carburateur sur une voiture en entier.
par(mfrow=c(2,1))
barplot(mtcars$carb, main="Nombre de carburateurs par voiture")
x <- mtcars$carb
curve(cume_dist(x),0,1, main="fonction de répartition empirique du nombre de carburateurs",)
quantile(mtcars$carb,c(0.1))
#2)
#On peut le lire sur la fonction de répartition empirique.
#On voit que la valeur de premier décile est 1.
