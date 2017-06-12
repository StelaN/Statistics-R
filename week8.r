#X = X1,..Xn - експериментално получени случайни величини
#математическо очакване Е(X) = mean(X) (mu)
#дисперсия D(X) = var(x)  (sigma^2)
#стандартно отклонение s = sd(x)  (sigma)
x = c(74, 122, 235, 111, 292, 111, 211, 133, 156, 79)
mean(x) #очакване
var(x) #дисперсия
sd(x) #стандартно отклонение

#централна гранична теорема - когато имаме много независими еднакво разпределенислучайни величини X1,..Xn, то сумата им след нориране е стандартна нормално разпределена велинина
#Y = ( sum(Xi) - E(sum(Xi)) ) / sqrt( D(sum(xi)) ) e стандартно нормално разпределена случайна величина
#E(sum(Xi)) = sum(EXi)  -> очакването на сума е сума от очакванията
#D(sum(Xi)) = sum(DXi)  -> дисперсия на сума е сума от дисперсиите

#твърдение: Xi = N(mu, sigma^2) - Xi случайни нормално разпределени величини с очакване mu и дисперсия sigma^2
#Xn.cherta = N(mu, (sigma^2)/n ) -> Xn.cherta = sum(Xi)/n -> статистическо средно e нормално разпределено с очакване mu и дисперсия (sigma^2)/n

#хи-квадрат разпределение
#Y1,..,Yn стандартно нормално разпределени случайни величини N(0,1)
#X^2(r) = sum(Yi^2) e хи-квадрат разпределение с r степени на свобода
#функцията chisq() с префикси d,p,q,r за съответно плътност, разпределние, квантил и случайно разпределение(симулиране)

#t-разпределение
#X = X1,...,Xn n независими измервания Xi, очакване mu, извадково средно mean(x), oценка за стандартно отклонение sd(x) и неизвестно sigma 
#най-добрата оценка за неизвестното sigma се дава с t-разпределение с n-1 степени на свобода
#функцията t() с префикси d,p,q,r за съответно плътност, разпределние, квантил и случайно разпределение(симулиране)

#f-разпределение - непрекъснато статистическо разпределение, получено от отношението на две хи-квадрат разпределения
#Fn,m = (X^2(n)/n) / (X^2(m)/m)
#тества дали две извадки имат еднаква дисперсия
#функцията f() с префикси d,p,q,r за съответно плътност, разпределние, квантил и случайно разпределение(симулиране)

#доверителен интервал
#имаме случайна величина X, която е с някакво разпределение, но не знаем някой параметър tita. Искаме да оценим този параметър tita с някаква вероятност на достоверност (gama = 1 - alpha). Тогава gama = 1 - alpha = P(-z* < tita < z*) -> от -z* до z* е  доверителния интервал  
#нормално разпределение -> z*=qnorm(1-alpha / 2) (защото е симетрично)
#биномно разпределение, когато tita = p (не знаем каква е вероятността за успех) -> интервала е [p.shapka - z* SE, p.shapka + z* SE], където p.shapka е експериментално получената вероятност, SE = sqrt((1/n) * p.shapka * (1-p.shapka))
#биномно разпределение, когато tita = p1 - p2 (искаме да оценим разликата във вероятностите за две случайно разпределни величини с големина n и m) -> интервала е [tita - z* SE, tita + z* SE], където SE = sqrt( (p1*(1-p1)/n + (p2*(1-p2)/m ) )
#нормално разпределение, когато tita = mu (не знаем очакването, но знаем дисперсията) -> интервала е [x.cherta - z* sigma/sqrt(n), x.cherta + z* sigma/sqrt(n)], където x.cherta = sum(Xi)/n = mean(xi) (средно аритметично - експериментално очакване)
#нормално разпределение, когато tita = mu, sigma (не знаем нито очакването, нито дисперсията) -> интервала е [x.cherta - t* s/sqrt(n), x.cherta + t* s/sqrt(n)], където x.cherta = sum(Xi)/n = mean(xi), s = sd(Xi) (експериментално стандартно отклонение), t* = qt(1-alpha, df = n -1)квантил на t-разпределение с n-1 степени на свобода

#-----------------------------------------------------

#01
#x1=Bi(100,1/2), x2=Bi(100,1/3)
cgt.binom = function(n,p) {
    xi = rbinom(n = 100, size = n, prob = p)
    EXi = n * p #EXi = n*p -> очакване за биномно разпределени величини
    DXi = n * p * (1-p) #DXi = n*p*q = n*p*(1-p) -> дисперсия за биномно разпределени велчини
    x1.norm = (xi - EXi) / sqrt(DXi) #нормираме всички величини
    hist(x = x1.norm, probability = TRUE)
    x = rnorm(100)  #симулираме нормално разпределени величини за да сравним 
    curve(dnorm(x), add = T)  #приличат си доста, значи и графично можем да кажем че е изпълнена централната гранична теорема
}
cgt.binom(100,1/2)
cgt.binom(100,1/3)

#02
temp = c(102.5, 101.7, 103.1, 100.9, 100.5, 102.2)
sd = 1.2
x=mean(temp)
alpha=1-0.95
z=qnorm(1-alpha/2) 
lower=x-z*sd
upper=x+z*sd

#03
#1000 случайни нормално разпределени величини
test.mu = function(mu, sigma.sq) {
  x = rnorm(n = 1000, mean = mu, sd = sqrt(sigma.sq))
  alpha=1-0.95
  z=qnorm(1-alpha/2)
  x.cherta=mean(x)
  #N(mu,1) -> formula 11
  x.lower=x.cherta-z*1
  x.upper=x.cherta+z*1
  plot(x)
  lines(x=0:1000,y=rep(x.upper,1001), col='red')
  lines(x=0:1000,y=rep(x.lower,1001), col='blue')
  
  x.length=length(x[x>=x.lower&x<=x.upper]) #броят на стойностите влизащи в доверителния интервал
  print(x.length)
  print(mean(x[x>=x.lower&x<=x.upper])) #средното на броят стойностите, влизащи в интервала
  x.length/1000 #вероятността някоя от случайните величини да е вътре в доверителния интервал
}

#N(2,2)
test.mu(2,2)
#N(2,1)
test.mu(2,1)

#04
#1000 случайни нормално разпределени величини
test.mu.sigma = function(mu, sigma.sq) {
  x = rnorm(n = 1000, mean = mu, sd = sqrt(sigma.sq))
  x.cherta = mean(x)
  s = sd(x)
  gama = 0.95
  t = qt(gama, df = 1000 - 1) #квантил на t-разпределение с n-1 степени на свобода
  #N(mu,sigma^2) -> формула 12
  x.lower = x.cherta - t*s
  x.upper = x.cherta + t*s
  plot(x)
  lines(x=0:1000,y=rep(x.upper,1001), col='red')
  lines(x=0:1000,y=rep(x.lower,1001), col='blue')
  
  x.length=length(x[x>=x.lower&x<=x.upper]) #броят на стойностите влизащи в доверителния интервал
  print(x.length)
  print(mean(x[x>=x.lower&x<=x.upper])) #средното на броят стойностите, влизащи в интервала
  x.length/1000 #вероятността някоя от случайните величини да е вътре в доверителния интервал
}


