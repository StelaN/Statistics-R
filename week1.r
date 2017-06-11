#initializing a vector
#c(x1,x2,..,xn) -> creates vector with elements x1,..,xn
x=c(1,2,3,4)

#selecting element of vector
#x[2] ->second element (returns vector)
#(counting starts from 1 not 0)
x[2]
x[1:3] #subset from first to third element

#excluding element
x[-1]  #without the second
x[-(2:4)]  #without from second to fourth

#concatenation of vectors
y=c(5,7,8,9,6,1)
z=c(y,x)

#using compariosons <,>,==,&,|,...
z[x>4 | x<=2]

#access to index
#which elements of vector (t) have value (1) -> returns vector of indexes
t=c(x,1)
s=which(t==1)

#generating sequensec
seq(3,23) #sequence from (3) to (23)
rep(x,5) #repeat vector (x) (5) times

#functions for vectors
sum(z) #sum of vector
mean(z) #average
sort(z) #returns sorted vector in increasing order
sort(z, decreasing = TRUE) #returns sorted vector in decreasing order
min(z) #min element
max(z) #max element
range(z) #the range of numbers
chars = c("A", "s", "P", "B")
range(chars)
cumsum(z) #vector of the partial sums of the given vector

#types: integer, numeric, double, complex, char, TRUE/FALSE/NULL, factor
#every type has a NULL pointer
#NA for missing data and impossible numeric results (division by 0)
#checing type with is.
#defining type with as.
is.null(x) #checks if it is null pointer
is.na(x) #checks if it is ok data
#checking type
is.numeric(x)
is.integer(x)
is.character(chars)

#defining matrix(data,nrow,ncol,byrow=TRUE/FALSE)
#or by as.matrix(data) -> matrix with ncol=1
as.matrix(z)
m=matrix(z[-10],ncol = 3,nrow = 3,byrow = TRUE)

#accessing elements of matrix
m[2,1] #element by indexes
m[,3] #colum ->returns vector
m[1,] #row ->returns vector
#selecting specific rows and colums ->returns matrix
m[c(1,3),]

#functions for matrix
dim(m) # dimensions of the given matrix
nrow(m) #first dimension
ncol(m) #same
diag(m) #primary diagonal
t(m) #transposes a matrix
solve(m) #reverse matrix
dimnames(m) = list(c("a", "b", "c"), c("1", "2", "3")) #gives names to the rows and colums

#operations with scalar/vector/matrix +,-,*,/,^,%*%
n=matrix(c(2,3,1,4),2,2,TRUE)
m[c(1,2),c(1,2)]
m[c(1,2),c(1,2)] + n
m[c(1,2),c(1,2)] * n   #multiplies each row by each row
m[c(1,2),c(1,2)] %*% n #tipical multiplication of matrixes

#01 
v=matrix(c("a","b","c","2","2","3"),TRUE)
v

#02
m1=matrix(1:6,2)
m2=matrix(c(rep(1,3),rep(2,3)),2,byrow=T)
m1
m2
solve(m1[,2:3])
m1*m2
m1%*%t(m2)

#03
x3=c(8,3,8,7,15,9,12,4,9,10,5,1)
mat3=matrix(x3,6,2)
colnames(mat3)=c("c1","c2")
mat3
mat3.max=max(mat3)
mat3.min=min(mat3)
mat3=rbind(mat3,c(runif(2,1,20)))
mat3[,2]*2+6
mat3[,2]=mat3[,2]*2
changemat3=mat3+6
changemat3

#04
n = 10
heads = 0:n
freqvector = heads / n
possibilities = choose(n, heads) / 2^n

possmatrix = matrix(c(freqvector, possibilities), ncol = 2)
plot(possmatrix)
