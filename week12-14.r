

#-----------------------------------------------------

#01
x=c(2,-6,7)
y=c(3,4,6)

#емпирично
r=cor(x,y)
sy=sd(y)
sx=sd(x)
b1=r*(sy)/sx
y.cherta=mean(y)
x.cherta=mean(x)
b0=y.cherta - b1*x.cherta

#теоретично
b=lm(y~x)

plot(x,y)
abline(b)
#abline(b0,b1)

#02
x=c(-2,-1,0,1,2)
y=x*x

plot(x,y)
abline(lm(y~x))
m1=lm(y~x)
cov(x,y)
summary(m1)

plot(x,y)
abline(lm(y~I(x^2)))
m2=lm(y~I(x^2))
summary(m2)
cov(x^2,y)

#03
x=c(0,4,10,15,21,29,36,51,68)
y=c(66.7,71,76.3,80.6,85.7,92.9,99.4,113.6,125.1)
m=lm(y~x)
plot(x,y)
abline(m)
summary(m)

#определете интервалите на параметрите на правата
alpha= 0.05
c=coefficients(summary(m))
b0 = summary(m)$coefficients[1]
se = summary(m)$coefficients[3]
b1 = summary(m)$coefficients[2]
se1 = summary(m)$coefficients[4]

upper0 = b0 + qnorm(1-alpha/2)*se
lower0 = b0 - qnorm(1-alpha/2)*se

upper1 = b1 + qnorm(1-alpha/2)*se1
lower1 = b1 - qnorm(1-alpha/2)*se1

#04
x=c(1.5, 1.7, 2.0, 2.5, 2.5, 2.7, 2.9, 3, 3.5, 3.4, 9.5, 9.5, 3.8, 4.2, 4.3, 4.6, 4, 5.1, 5.1, 5.1, 5.2, 5.5)
y=c(3, 2.5, 3.5, 3, 3.1, 3.6, 3.2, 3.9, 4, 4, 8, 2.5, 4.2, 4.1, 4.8, 4.2, 5.1, 5.1, 5.1, 5.1, 4.8, 5.3)
plot(x,y)
m=lm(y~x)
abline(m)
summary(m)

#махаме outlier-ite
boxplot(x,y)
x.better=c(1.5, 1.7, 2.0, 2.5, 2.5, 2.7, 2.9, 3, 3.5, 3.4, 3.8, 4.2, 4.3, 4.6, 4, 5.1, 5.1, 5.1, 5.2, 5.5)
y.better=c(3, 2.5, 3.5, 3, 3.1, 3.6, 3.2, 3.9, 4, 4, 4.2, 4.1, 4.8, 4.2, 5.1, 5.1, 5.1, 5.1, 4.8, 5.3)
m.better = lm(y.better~x.better)
plot(x.better,y.better)
abline(m.better)
summary(m.better)
rstandard(m.better) #???

#05
Er_red= 630.43
Er_full = 615.62
p = 2;
sfull=1.513
fratio = (Er_red-Er_full)/(p*sfull^2)
fratio
df(3.23,2,269)

#06
#install.packages("faraway")
library(faraway)
?savings
#install.packages("car")
library(car)
scatterplotMatrix(savings)
savings
x=lm(savings$sr~savings$pop75+savings$pop15+savings$dpi+savings$ddpi)
y1=lm(savings$sr~savings$pop15+savings$dpi+savings$ddpi)
y2=lm(savings$sr~savings$pop75+savings$pop15+savings$ddpi)
summary(y1)
summary(y2)
summary(x)
anova(x)
anova(y1)
anova(y2)
predict(y2,interval='confidence')
