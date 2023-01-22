#matrices topic


#matrices data loaded

Salary

Salary[3,4]  #indexation here to get the particular value u need to use this for m[row,column]

#building a matrix


#rbind() - this starts from r1, r2
#cbind() - this starts from c1,c2


?matrix

my.data <- 1:20


A <- matrix(data=my.data, 4,5)
A
A[2,3]


B <- matrix(data=my.data, 4,5, byrow = T)
B[2,5]

#rbind() and cbind()
r1 <- c("I","am","happy")
r2 <- c("its", "great", "day")
r3 <- c(1,2,3)

c<- rbind(r1,r2,r3)
c
d <- cbind(r1,r2,r3)
d

#naming dimensions

charlie <- 1:5
charlie


#giving names for vector
names(charlie) #names is a function which results back names of variable

names(charlie) <- c("a","b","c","d","e")
  
names(charlie)

charlie
charlie["d"]

#clearing names
names(charlie) <- NULL #this will clear the names
names(charlie)
charlie

#naming matrix

temp.vec <- rep(c("a","B","zZ"), each=3)

Bravo <- matrix(data = temp.vec, 3,3)
Bravo

rownames(Bravo) <- c("How","are","you")
colnames(Bravo) <- c("x","y","z")

Bravo


Bravo["How", "y"] <- 0

Bravo


#matrix Operations

Games


rownames(Games)
colnames(Games)

round(FieldGoals/Games,1)

round(MinutesPlayed/Games,1)

#visualization using matplot

?matplot

matplot(t(FieldGoals/Games), type="b", pch= 15:18, col = c(1:4,6))

legend("bottomleft", inset=0.01, legend=Players, col = c(1:4,6),pch= 15:18, horiz = F)

FieldGoals
t(FieldGoals/Games) #transposed matrix t() - function to be used

#subsetting

x <- c("a","b","c","d","e")
x

x[c(1,5)]
x[1]

Games

Games[1:3,6:10]

Games[c(1,10),1:10]
Games[,c("2008","2009")]


Games[1,]
is.matrix(Games[1,])

is.vector(Games[1,])

Games[1,5]


#fixing a vector to matrix

Games[1,,drop=F] #drop = F will fix this issue
Games[1,5,drop=F]

is.matrix(Games[1,,drop=F])


#Visualizing subsets
Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type="b", pch= 15:18, col = c(1:4,6))

legend("bottomleft", inset=0.1, legend=Players[1], col = c(1:4,6),pch= 15:18, horiz = F)
Data

?matplot


#creating functions

myplot <- function(data, rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b", pch= 1:15, col = c(1:4,6))
  legend("bottomleft", inset=0.1, legend=Players[rows], col = c(1:4,6),pch= 1:15, horiz = F)
  
}


#analyzing basketball dataset with the myplot function we made
myplot(Salary)
myplot(Salary/Games)
myplot(Salary/FieldGoals)

myplot(MinutesPlayed)
myplot(Points)

myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

myplot(MinutesPlayed/Games)
myplot(Games)

myplot(FieldGoals/MinutesPlayed)

myplot(Points/FieldGoals)

