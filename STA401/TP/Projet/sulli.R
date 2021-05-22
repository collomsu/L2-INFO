data=read.csv("INF3-Collomb-Sullivan.csv")

data=choose.files()

data=file.choos

df = read.csv(file.choose(), sep = ",", header = T, quote = "")



midi=df$Midi
soir=df$Soir
mean(midi)
mean(soir)

sd(midi)
sd(soir)
var(midi)

#Intervalle de Confiance à 5%

#1) Sur la moyenne

#Midi :

t.test(midi)

#Ou

n=length(midi)
a=qt(97.5/100,n-1,lower.tail=T)
B=mean(midi)+(sd(midi)/(sqrt(n)))*a
A=mean(midi)-(sd(midi)/(sqrt(n)))*a
paste('L intervalle de confiance recherche est IC(95%)=[',A,B,']')

#Soir

t.test(soir)

#Ou

n=length(soir)
a=qt(97.5/100,n-1,lower.tail=T)
B=mean(soir)+(sd(soir)/(sqrt(n)))*a
A=mean(soir)-(sd(soir)/(sqrt(n)))*a
paste('L intervalle de confiance recherche est IC(95%)=[',A,B,']')

#2) Sur l'ecart type

#Midi :

n=length(midi)
sx <- sd(midi)
estimate <- sx**2

c=qchisq(1-(0.05/2),df=n-1)
d=qchisq((0.05/2),df=n-1)
C=(n - 1)*sx**2/c     
D=(n - 1)*sx**2/d

paste('L intervalle de confiance recherche est IC(95%)=[',C,D,']')


#Soir

n=length(soir)
sx <- sd(soir)
estimate <- sx**2

c=qchisq(1-(0.05/2),df=n-1)
d=qchisq((0.05/2),df=n-1)
C=(n - 1)*sx**2/c     
D=(n - 1)*sx**2/d

paste('L intervalle de confiance recherche est IC(95%)=[',C,D,']')

#Tests sur un échantillon

#1) Test de la moyenne avec mu0=27 (trouve avec la moyenne observée)
t.test(midi, mu=27)

H0 : mu(midi) = 27 VS H1 : mu(midi) != 27

On obtient p.value>0.05 donc on ne rejette pas H0

#1) Test de l'ecart type avec sigma0=9 (trouve avec var(soir))

var(soir)
H0 : sigma(soir) = 140 VS H1 : sigma(soir) != 140

library(EnvStats)
varTest(soir,sigma.squared = 140)


On obtient p.value>0.05 donc on ne rejette pas H0

#Tests sur deux échantillons

#1) Comparaison des moyennes de deux groupes : test de Student
t.test(midi, soir)

H0 : mu(midi) = mu(soir) VS mu(midi) != mu(soir)
var.test(midi,soir)

On obtient p.value>0.05 donc on ne rejette pas H0

#2) Comparaison des variances de deux groupes : test de Fisher

H0 : sigma(midi) = sigma(soir) VS H1 : sigma(midi) != sigma(soir)

var.test(midi,soir)

On obtient p.value>0.05 donc on ne rejette pas H0


















