#selecting and grouping data
#keeping -> selecting variables through indexes or ... %in%
#dropping -> ommitting variables through -indexes or !
mons = c("March", "April", "January", "November", "January", "September",
         "October", "September", "November", "August", "January", "November",
         "November", "February", "May", "August", "July", "December",
         "August", "August", "September", "November", "February", "April")
fmons = factor(mons, ordered = TRUE) #the labels are ordered in alphabetical order
tmons = table(fmons)
vars = names(tmons) %in% c("January", "April", "March")
tmons.new = tmons[!vars]
tmons.new2 = tmons[-c(1,5,7)]
#selection using whitch() or subset()
#appending a vector at specific index using append()
#joinning data.frames using merge() 

#operations on tables
#apply(array, margin, function, ...) -> returns vector with the result of function
mat = matrix(rep(seq(4),4), ncol = 4)
sum.by.row = apply(mat, MARGIN = 1, FUN = sum) #margin = 1 means by rows
sum.by.column = apply(mat, MARGIN = 2, FUN = sum) #margin = 2 means by colums
sum.2 = apply(mat, MARGIN = 1, function(x) sum(x) + 2) #to every row sum adds two

#lapply(list, function,...) -> returns list, used when working with data.frames
mat.df = data.frame(mat)
lapply(mat.df, FUN = sum)
y = lapply(mat.df, FUN = function(x,y) sum(x) + y, y =5)
print = lapply(1:5, FUN = function(i) print(i)) #simulates loop

#tapply(array, indicies, function, ..., simplify) -> returns a vector or matrix with dimentions according to indicies
#if simplify = FALSE returns a list
x1 = runif(16) #16 random numbers between 0 and 1
cat1 = rep(1:4,4)
cat2 = c(rep(1,8), rep(2,8))
mat2.df = data.frame(x1)
mat2.df$cat1 = cat1 #adding vector cat1 to the data frame
mat2.df$cat2 = cat2 #adding vector cat2 to the data frame
tapply(mat2.df$x1, mat2.df$cat1, mean)

#agregation from data.frame
dates <- data.frame(date = as.Date("2001-01-01", format = "%Y-%M-%D")+ 0:729, data=0:729) #????
last.day <- aggregate(x = dates["date"], by = list(month = substr(dates$date, 1, 7)), FUN = max)
last.data <- aggregate(x = dates["data"], by = list(month = substr(dates$date, 1, 7)), FUN = max)


#-----------------------------------------------------

#02
m = 2.5
a = c(0,1.5,2)
b = c(2,0,1.5)
c = c(2,1,0.5)
mat = matrix(c(a,b,c), ncol = 3, byrow = TRUE)
apply(mat, MARGIN = 1, FUN = function(x,m) (sum(x)*m)/sum(c(m,m,m)), m = m)

#03
x2.0 = c(1/8, 1/8, 0, 0)
X2.1 = c(0, 2/8, 2/8, 0)
X2.2 = c(0, 0, 1/8, 1/8)
m = matrix(c(x2.0, X2.1, X2.2), ncol = 4, byrow = TRUE, dimnames = list(c(0,1,2), c(0,1,2,3)))
p.x1 = apply(m, MARGIN = 2, FUN = sum) #marginal probability for x1 
p.x2 = apply(m, MARGIN = 1, FUN = sum) #marginal probability for x2
sum(p.x1)
sum(p.x2)
e.x1 = sum(p.x1 * as.numeric(names(p.x1)))
e.x2 = sum(p.x2 * as.numeric(names(p.x2)))
e.x1.sq = sum(p.x1 * (as.numeric(names(p.x1)))^2 )
e.x2.sq = sum(p.x2 * (as.numeric(names(p.x2)))^2)
d.x1 = e.x1.sq - e.x1^2
d.x2 = e.x2.sq - e.x2^2

EX1 = apply(m, MARGIN = 2, FUN = function(x,y) sum(x*y), y=c(0:2))
EX2 = apply(m, MARGIN = 1, FUN = function(x,y) sum(x*y), y=c(0:3))

#04
aggregate(mtcars, by=list(mtcars$cyl, mtcars$vs), FUN="mean")



