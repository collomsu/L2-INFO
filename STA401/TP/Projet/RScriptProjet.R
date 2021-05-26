### Création des variables avec les données récoltées (en min)
setwd("~/GitHub/L2_INFO/STA401/TP/Projet")
df <- read.table('INF3-Collomb-Sullivan.csv', header=TRUE, sep=',')
midi <- df$Midi
soir <- df$Soir

### Résumé numérique
summary(df)
sd(midi)
sd(soir)

### Graphique
# Boxplot
boxplot(midi,soir, main="Temps de repas le midi et le soir (en min)", ylab="Temps (en min)", names=c("Midi","Soir"))

# Hist
par(mfrow=c(1,2))
hist(midi, main = "Histogramme des résultats du midi", probability =  TRUE)
curve(dnorm(x,mean(midi),sd(midi)), add = T, col = "red")
hist(soir, main = "Histogramme des résultats du soir", probability =  TRUE)
curve(dnorm(x,mean(soir),sd(soir)), add = T, col = "red")

# Qqnorm
par(mfrow=c(1,2))
qqnorm(midi, main = "Quantile-quantile plot pour les résultats du midi", ylab = "Temps (en min)")
qqline(midi,col="red")
qqnorm(soir, main = "Quantile-quantile plot pour les résultats du soir", ylab = "Temps (en min)")
qqline(soir,col="red")

### Estimation et intervalle de confiance
## Sur la moyenne
t.test(midi)
t.test(soir)

## Sur l'ecart type
# Midi :
n=length(midi)
sx <- sd(midi)
estimate <- sx**2
c=qchisq(1-(0.05/2),df=n-1)
d=qchisq((0.05/2),df=n-1)
C=(n - 1)*estimate/c     
D=(n - 1)*estimate/d
paste('L intervalle de confiance recherche est IC(95%)=[',C,D,']')

# Soir
n=length(soir)
sx <- sd(soir)
estimate <- sx**2
c=qchisq(1-(0.05/2),df=n-1)
d=qchisq((0.05/2),df=n-1)
C=(n - 1)*estimate/c     
D=(n - 1)*estimate/d
paste('L intervalle de confiance recherche est IC(95%)=[',C,D,']')

### Tests sur un échantillon 
# Test de la moyenne avec mu0=27 
t.test(midi, mu=27)
#  H0 : mu(midi) = 27 VS H1 : mu(midi) != 27

# Test de la moyenne avec mu0=33 
t.test(soir, mu=33)
#  H0 : mu(midi) = 33 VS H1 : mu(midi) != 33

### Tests sur deux échantillons-
## Comparaison des moyennes de deux groupes : test de Student
t.test(midi, soir)
# H0 : mu(midi) = mu(soir) VS mu(midi) != mu(soir)

## Comparaison des variances de deux groupes : test de Fisher
# H0 : sigma(midi) = sigma(soir) VS H1 : sigma(midi) != sigma(soir)
var.test(midi,soir)

