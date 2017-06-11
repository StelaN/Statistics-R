#factorization of data - factor() usefull when working with vector of strings, because each string is represented only once
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
levels(fdata) #returns vector of the different values in the factor -> always as string

#defining the lables changes the whole factor
rdata = factor(data, labels = c("I", "II", "III"))
#changing the levels of an existing factor changes the whole factor
levels(fdata) = c("a", "b", "c")

mons = c("March", "April", "January", "November", "January", "September",
         "October", "September", "November", "August", "January", "November",
         "November", "February", "May", "August", "July", "December",
         "August", "August", "September", "November", "February", "April")
fmons = factor(mons, ordered = TRUE) #the labels are ordered in alphabetical order
tmons = table(fmons) #table showing each label how many times can be found in the factor

fert = c(10, 20, 20, 50, 10, 20, 10, 50, 20)
ffert = factor(fert, levels = c(10, 20, 50), ordered = TRUE)
mean(as.numeric(ffert)) #error - wrong mean
mean(as.numeric(levels(ffert)[ffert])) #correct mean

prop.table(tmons) #probability each month to be found in the table of factored mons


#lists - vectors that can have different type and length, can and should have labels for access (a = ,b = , c = )
mylist = list(a = 1:5, b = "Hi there!", c = function(x) x * sin(x))

#accessing
mylist[1] #returns list of the first vector (the firts element of the list)
mylist[[1]] #returns vector using index
mylist[["b"]] #returns vector using the label
mylist$b #returns vector using the label -> easier and more commonly used
mylist$a[3] #returns the element from the vector with this label
length(mylist) #length of the list
length(mylist$b) #length of the firts element of the list
mylist$d = "new item" #appending new elements
mylist$b = NULL #deleting an element
unlist(mylist) #deleting the list


#data frames - list with equal length of all vectors
n = c(2,3,5)
s = c("aa", "bb", "cc")
b = c(TRUE, FALSE, TRUE)
df = data.frame(n,s,b) #creating the data frame -> every vector is a new column with n rows

#access like a list
df$s #returns a factor???
df[2] #returns a vector(column) ???
df[2,2] #returns the element in row 2 column 2 (but as factor???)
head(df, n = 2) #returns the first n rows from the data frame (default n = 6)
tail(df, n = 2) #returns the last n rows from the data frame (default n = 6)

#reading data
#read.table("url address or apth to file") -> when the file is organised like a table
#read.csv("url address or apth to file") or read.csv2() -> redaing a csv file

#graphics
#plot() -> normal xy graphic (use ?plot in console for details)
#barplot() -> barplot with veritcal or horizontal lines (use ?barplot in console for details)
#pie() -> pie chart (use ?pie in console for details)
#boxplot() -> used for finding median, quantil or outliers

#-----------------------------------------------------

#01
x1 = list(1,2,3,4) #list with 4 elements each of with an integer
x2 = list(1:4) #list with one element - vector of integers from 1 to 4
x1[1] #firts element of the list wich is a vector with length one having the integer 1
x1[[1]] #first element of the first element of the list

#02
# 1. all cars with 7 cyl -> different ways to get the same answer
res1 = mtcars[which(mtcars$cyl == 8),]
res2 = mtcars[mtcars$cyl == 8,]
res3 = subset(mtcars, mtcars$cyl == 8)
# 2. average mpg for cars with 5 gears -> different ways to get the same answer
res1.2 = mean(mtcars[mtcars$gear == 5,]$mpg)
res2.2 = mean(mtcars$mpg[mtcars$gear == 5])

#03
library("MASS")
barplot(table(survey$Sex, survey$Smoke), beside = TRUE, legend = levels(survey$Sex))
boxplot(survey$Height~survey$Sex)
hist(survey$Pulse)

