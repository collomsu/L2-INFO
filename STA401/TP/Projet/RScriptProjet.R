### Création des variables avec les données récoltées (en min)
setwd("~/GitHub/L2_INFO/STA401/TP/Projet")
res <- read.table('INF3-Collomb-Sullivan.csv', header=TRUE, sep=',')
midi <- res$Midi
soir <- res$Soir

### Résumé numérique
summary(res)
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