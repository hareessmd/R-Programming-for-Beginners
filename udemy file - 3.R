# vectors start with 1 not with 0

myvect <- c(2,3,46,77,311)
# by default vectors store the numbers along with decimal points even if they don't have decimals, so it is shown as numeric, double but not integers

seq() # sequence like ':'
rep() # replicate 

seq(1,15)

seq(1,15,2)

x<- seq(1,15,4) #this gives numbers with '4' difference between them
x

rep(3,50) # this gives 3 50 times as output

d <- rep(2,15) #2 - 15 times
d

c<- c(8,29)
y <- rep(c, 20) # this repeats vector 'c' 20 times
y

#using brackets []

w <- c("a", "b", "c", "d", "e")
w
w[1] #this will give first letter
w[4]
w[-1] #this give the letters except first letter

w[-3]
v <- w[-3]
v

w[1:3]
w[seq(1,3)]

w[c(1,4,2)]
w[c(-2,-4)]

#vectorized operations

#vector arithematics

f <- c(1,2,3,4,5,6,7,8,9)
b<- c(9,8,7,6,5,4,3,2,1)
n <- f+b
n


#recycling of vectors
# multiple of big vector - smaller vector elements will be reused for next steps to peform arth ops on bigger vector
#not multiple of vector - itstill follow the above step but gives an warning kind of thing

#powerized vector operations

x<- rnorm(5)

for (i in x) {
  print(i)
}

print(x[1])
x[2]

#conventional programming loop
for (j in 1:5) {
  print(x[j])
}

#----------------------------------------

#vectorized vs devectorized
n <- 10000000
a <- rnorm(n)
b <- rnorm(n)

#vectorized approach - faster and better approach in R

c <- a*b
c


#devectorized approach

d<- rep(NA, n) #empty vector

for (i in 1:n) {
  d[i] <- a[i] * b[i]
}

d


#?

x<- c("a","b", "c")

rnorm(n=5,mean=10,sd=6)

?c()
?seq()
 A <- seq(from=1,to=20,along.with=x)


?rep()

rep(5:6,times=11)

rep(5:7, each=11)
rep(x, each=5)


sqrt(A)


#packages

install.packages("ggplot2")
?qplot()

?diamonds


library(ggplot2)
head(diamonds)
qplot(diamonds$carat)

