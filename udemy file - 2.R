#integer
# <- assignment operator

x<- 2L
class(x)

#double any thing with decimal points

y <- 2.5
class(y)
typeof(y)

cat("\014")


A <- 10
B<- 5
c<- A+B
print(c)


var1 <- 2.5
var2 <- 4
result = var1/var2
result


ans <- sqrt(var2)
ans

greeting <- "Hello World!"
name <- "Bob"

message <- paste(greeting, name) #paste is the command we use to make string concatination

message


cat("\014")

#logical operators
#TRUE
#FALSE

4<5
10>199
4==5
4!=5

#| or op
#& and op
#isTRUE(x)

result <- 4<5
result
typeof(result)
res2 <- !(TRUE)
res2
 res3 <- !(4<5)
res3 

result | res2

result & res2

isTRUE(res3)




#Important topic
#while loop 

while (abc) {
xyz  
}

#here xyz(code) will be executed until abc(true/false) becomes false

while (FALSE) {
  print("Hello")
} #FAlse - it will not printt anaything
#true - infinate loop cont. prints hello


counter <- 1
while(counter<10){
  print(counter)
  counter<- counter+1
}


#For loop

for (i in 1:5) {
  print("Hello R")
} #1:5 = 1 2 3 4 5 is a vector, the loop exectues hello r five times



#IF loop
rm(answer) #to remove the variable
x <- rnorm(1) #this geenrate one random number

if (x >1) {
  answer <- "it is greater than 1"
} else if (x>= -1) {
    answer <- "Between -1 and 1"
} else{
    answer <- "it is less than 1"
}
  







