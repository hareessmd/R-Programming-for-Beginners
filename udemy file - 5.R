# data frames are similar to matrices but we can store any type of data like character data or numeric data in data frames where as matrices only store similar kind of data

#data frames
# demographic analysis

?read.csv()

#method1 - select file manually

#stats <- read.csv(file.choose())
stats

#method2 - set data path and read data

getwd()
#windows
#setwd("C:\\Users\\haree\\OneDrive\\Desktop\\R Files")
#getwd()
#rm(stats)
#stats <- read.csv("P2-Demographic-Data.csv")

#explore data set

stats
nrow(stats) #no. of rows
#imported 195 rows

ncol(stats) #no.of columns
head(stats) #shows top 6 rows
tail(stats) #shows bottom 6 rows
tail(stats, n=8)

str(stats) #str() - structure; runif() - random normal function

summary(stats)


#$ operator/sign

stats
head(stats)
stats[3,3]
stats["3","Birth.rate"]

stats$Internet.users
stats$Internet.users[3]

levels(stats$Income.Group)


str(stats)

#basic operations with data frames

stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

stats[1,]

is.data.frame(stats[1,])

stats[,1]

is.data.frame(stats[,1])

stats[,1, drop=F]
is.data.frame(stats[,1, drop=F])

#mathematical operations

stats$Birth.rate * stats$Internet.users

stats$Birth.rate + stats$Internet.users

#add a column to data frames
head(stats)

stats$mycal <- stats$Birth.rate * stats$Internet.users

stats
head(stats)


#test of knowledge

stats$xyz <- 1:5
head(stats, n=12)


#remove a column 

stats$xyz <- NULL
head(stats)

stats$mycal <- NULL

#filtering data frames

head(stats)
filter <- stats$Internet.users < 2

stats[filter, ] # here filter has same exact rows ast hat of data set we are using and filter is a  vector - everytime is comes across true it will display the data and if it comes across false it won't display data

stats[stats$Birth.rate > 40,]

norow <- stats$Birth.rate > 40

rm(norow)

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]

stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]

#qplot function - intoduction

install.packages("ggplot2")
?qplot

qplot(data = stats, x=Internet.users, y=Country.Name)
qplot(data = stats, 
      x=Income.Group, 
      y=Birth.rate,
      geom = "boxplot"
      )

#visualising qplot - part 1 (challenge 1 is dne)

qplot(data = stats, x= Internet.users, y = Birth.rate,
      size = I(4),
      colour= Income.Group)

#building/creating data frames

mydf <- data.frame(
  Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset
)
head(
  mydf
)

#colnames(mydf) = c("Country", "Code", "Region")
#head(mydf)
#rm(mydf)

mydf <- data.frame(
  Country=Countries_2012_Dataset, 
  Code=Codes_2012_Dataset, 
  Region=Regions_2012_Dataset
)

head(mydf)

summary(mydf)

#merging two data frames

head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y="Code")

head(merged)


merged$Country <- NULL
head(merged)

#shapes
qplot(data= merged, 
      x=Internet.users, 
      y=Birth.rate,
      colour=Region,
      size = I(2),
      shape= I(23))

#transparency (alpha function)
qplot(data= merged, 
      x=Internet.users, 
      y=Birth.rate,
      colour=Region,
      size = I(2),
      shape= I(17),
      alpha= I(0.3))

#how to add title
qplot(data= merged, 
      x=Internet.users, 
      y=Birth.rate,
      colour=Region,
      size = I(2),
      shape= I(17),
      alpha= I(0.3),
      main="Birth Rate vs Internet Users")

?qplot
