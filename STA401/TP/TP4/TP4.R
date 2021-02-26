#Exercice préliminaire
MU = c(0,0,0,3)
SIGMA = c(1,0,5,2,1)
for(i in 1:length(MU)){
  curve(dnorm(x,MU[i], SIGMA[i]),from = -8, to=8, ylim=c(0,1), col=i,add=i!=1)
}
legend(-6,1,legend=1:length(MU), lty=1, col= 1:length(MU))
abline(v=c(-1,1),lty = 2)
segments(x0=-1,y0=0,x1=1,lwd = 2, col="red")

#p4<p3<p1<p2

#2
mu = -1
sigma = 0.2
curve(dnorm(x,mu,sigma),from = -6, to = 8, ylim = c(0,2), n=301)
curve(pnorm(x,mu,sigma),from = -6, to = 8, add = T, col = "red", n=301)

#Exerice 1
#1
mu  =2
sigma = 3
pnorm(4,mu,sigma)-pnorm(-2,mu,sigma)
curve(dnorm(x,mu,sigma),from=-4,to=8)
abline(v=c(-2,4),lty=2)

#2
mu  =2
sigma = 3
m=1
pnorm(mu+m*sigma,mu,sigma)-pnorm(mu-m*sigma,mu,sigma)
curve(dnorm(x,mu,sigma),from=-4,to=8)
abline(v=c(mu-m*sigma,mu+m*sigma),lty=2)
abline(v=mu, col=3)

#3
mu = 2
sigma = 3
m=2
pnorm(mu+m*sigma,mu,sigma)-pnorm(mu-m*sigma,mu,sigma)
curve(dnorm(x,mu,sigma),from=-4,to=12)
abline(v=c(mu-m*sigma,mu+m*sigma),lty=2)
abline(v=mu, col=3)
m=3
pnorm(mu+m*sigma,mu,sigma)-pnorm(mu-m*sigma,mu,sigma)
curve(dnorm(x,mu,sigma),from=-4,to=12)
abline(v=c(mu-m*sigma,mu+m*sigma),lty=2)
abline(v=mu, col=3)

#4
n=9
ordres = 1:9/(n+1)
deciles = qnorm(ordres,mu,sigma)
decilesU = deciles
#5
curve(pnorm(x), from = -3, to = 3)
points(x = ordres, y = rep(0,9))
segments(x0 = deciles, y0 = 0, y1 = ordres,  lty = 2)
segments(x0 = -4, x1 = deciles, y0 = ordres, lty=2)
deciles[9]

#6
mu = -1
sigma = 5
decilesX = qnorm(ordres,mu,sigma)
plot(decilesU, decilesX)

#7
abline(mu,sigma)
