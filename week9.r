#функция на разпределение на две случайни велични: F X,Y(x,y) = P(X<=x, Y<=y)
#две случайни величини X, Y са независими, ако за всяко x,y e изпълнено: F X,Yx,y) = F X(x) * F Y(y) или P(X=x, Y=y) = P(X=x) * P(Y=y)
#ковариация на две случайни величини: cov(X,Y) = E(XY) - EX*EY
#корелация на две случайни величини: cor(X,Y) = cov(X,y)/sqrt(DX*DY)
#ако X,Y са независими, то cor = 0, обратното не е вярно
#ако корелацията клони към 1 или -1, значи X и Y са зависими
#за графики: scatterplot и pairs
#cor=1
x=c(1:10)
y=c(1:10)
cor(x,y)
plot(x,y)

#cor=-1
x=c(1:10)
y=c(10:1)
cor(x,y)
plot(x,y)
plot(y,x)

#cor~0
x=rnorm(100)
y=rexp(100)
cor(x,y)
plot(x,y)

#многомерно нормално разпределение
#n-мерна случайна величина X = (X1,..,Xn) с нормално разпределение N(m,K), K=E((X - m)(X - m)transp) ковариационна матрица
install.packages('mvtnorm')
library('mvtnorm')
x=y=seq(-5,5, length=50)
f=function(x,y)dmvnorm(cbind(x,y))
z=outer(x,y,f)
persp(x,y,z, theta=10, phi=20,expand=0.5, col="light blue")
persp(x,y,z, theta=10, phi=20,expand=0.5, col="light blue", shade=0.75)



#-----------------------------------------------------

#01
x=iris[,1:4]
cor(x)
pairs(x)

#02
#Kz ковариация на X=(X1, X2, X2) -> по диагонала е DXi = E(Xi^2) - (EXi)^2
#другите елементи на матрицата са ковариацията на елементите два по два
Kz = matrix(c(16, -14, 12, -14, 49, -21, 12, -21, 36), ncol = 3, byrow = TRUE)
cor(Kz) #като че ли не го смята никак правилно
#супер грозен начин за решаване, но май е по-верен? :)
#не се прави така, нямам идея как се прави, но и не ни трябва да го знем за момента
cov.X1.X2 = Kz[1,2] / sqrt(Kz[1,1]*Kz[2,2])
cov.X1.X3 = Kz[1,3] / sqrt(Kz[1,1]*Kz[3,3])
cov.X2.X3 = Kz[2,3] / sqrt(Kz[2,2]*Kz[3,3])
cov.X = matrix(c(1, cov.X1.X2, cov.X1.X3, cov.X1.X2, 1, cov.X2.X3, cov.X1.X3, cov.X2.X3, 1), ncol = 3, byrow = TRUE)
