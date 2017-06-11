

#-----------------------------------------------------

#01
library("MASS")
q = quine
tb=table(q$Eth,q$Sex)
prop.test(tb, correct=FALSE)

#02
x=c(170, 167, 174, 179, 179, 156, 163, 156, 187, 156, 183, 179, 174, 179, 170, 156, 187, 179, 183, 174, 187, 167, 159, 170, 179)
#H0: m = 170 and H1:m>170
t.test(x,mu=170,alt="less")
#H0: m=170 and H1:m<170
t.test(x,mu=170,alt="greater")

#03
x=c(7.65, 7.60 ,7.65, 7.70, 7.55, 7.55, 7.40, 7.40, 7.50, 7.50)
m=7.5
t.test(x,mu=m,alt="two.sided")

#04
x = c(12.8,3.5,2.9,9.4,8.7,0.7,0.2,2.8,1.9,2.8,3.1,15.8)
wilcox.test(x,mu=5.0,alt="greater")

#05
library("MASS")
tbl = table(survey$Smoke, survey$Exer)
chisq.test(tbl)

ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"])
chisq.test(ctbl)

#06
#вариант 1
n=567
k = seq(0,5)
nk=c(229,221,93,35,7,1)
lambda = 0.93
nn=nk/n
pk = dpois(k,lambda)
pk[7] = 1 - sum(pk)
chi2 = sum(((nk - n*pk)^2)/n*pk)
pchisq(chi2,df = 5, lower.tail = FALSE)

#вариант 2
n=c(229,221,93,35,7,1)
nn=n/sum(n)
p=dpois(0:4,0.93)
p[6] = 1 - sum(p)
chisq.test(nn,p = p)

#07
a = rnorm(100,0,1)
b = rnorm(100,1,1)
var.test(a,b)
