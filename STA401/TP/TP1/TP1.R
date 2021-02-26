#-------------Exercice 1-----------
#instructions
setwd("~/L2 INFO/STA401/TP")
1:10
#R Retourne [1]  1  2  3  4  5  6  7  8  9 10
init<-1:10
help(":")

#Exo2
#4)
x[1]
x[c(2,4)]
x[2:4]

#5)
c(2,4,6,8,10) -> y
c("a","b","c","d","e") -> label

#6)
matrix(c(x,y),ncol=2,byrow=F) -> A

#7)
A[1,]
un <- rep(1,5)
matrix(c(x,y,un),ncol=5,byrow=F)

#Exo3
#1)
x/5

#2)
x+5

#3)
sum(x)
cumsum(x)

#4)
length(x)

#5)
sqrt(x)

#6)
x^2

#7)
x
xp = c(x,6)
c(x,6,7,8)
c(x,c(6,7,8))
c(x,rep(1,5))

seq(1,10,2)

#8)
which(x>3)
length(which(x>3))
sum(x>3)

#10)
x[which(x!=20)]
sum(x>0 & x<2)

#Exo4
y+x
x*x

A=cbind(x,y)
t(A)
rbind(x,y)

#Exo5
B=2*A

A*B
a=c(1,2)
t(a)%*%t(A)

#Exo6
#1)
abs=seq(0,7,0,1)
ord=sin(abs)
plot(abs,ord,main= "Tracer de sinus", xlab ="valeurs de x", ylab = "sin(y)")
curve(sin(x),0,7,100,add = T , col = "red")
abline(a=1,b=0,col="red")
abline(a=0, b=1,col = "red")
points(3,1)