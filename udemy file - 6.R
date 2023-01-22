#advance ggplot2 viz

getwd()
setwd("C:/Users/haree/Downloads") #setting work directory
getwd()
movies <- read.csv("P2-Movie-Ratings.csv") #choosing file
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)


str(movies)


movies$Film <- as.factor(movies$Film) #making films and genre as factors 
movies$Genre <- as.factor(movies$Genre)


head(movies)
str(movies)

summary(movies)

movies$Year <- as.factor(movies$Year)

#aesthetics

library(ggplot2)
?ggplot
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point() #here we are displaying data in points


#add colour
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre)) +
  geom_point()
#add size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre, size=Genre)) +
  geom_point()
#add size in better way
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre, size=BudgetMillions)) +
  geom_point()


#layers plotting

p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=BudgetMillions))
#points
p+ geom_point()
#lines
p+ geom_line()

#multiple layers
p+ geom_line() + geom_point()
p+geom_point() + geom_line()

#overriding aesthetics

q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=BudgetMillions))
q + geom_point(aes(size=CriticRating)) #here we are overriding size of budget with criticrating

q + geom_point(aes(colour=BudgetMillions)) #here we are overriding colour of genre with BudgetMillions

#q remains same when no overriding is involved
q + geom_point()

#overriding x and y
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $")

#reducing line size

q+ geom_line(size=1) + geom_point()


#mapping vs setting


r<- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#add colour
#1. mapping (what we have done so far)

r + geom_point(aes(colour=Genre))

#2. setting
r+ geom_point(colour="DarkGreen")

#size
#1.mapping
r+geom_point(aes(size=BudgetMillions))

#2. setting
r+geom_point(size=3)

#histograms and density charts

s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 5)

#add colour
s + geom_histogram(binwidth = 5, aes(fill=Genre)) #here colour is reps as fill

#add border
s + geom_histogram(binwidth = 5, aes(fill=Genre), colour="Black") # here to add border colour fuc is used

#DENSITY CHARTS
s + geom_density(aes(fill=Genre), position = "stack") #this positon stack help to gather all the curves at one place


#starting layer tips

t <- ggplot(data = movies, aes(x=AudienceRating))

t + geom_histogram(binwidth = 10,
                   fill="white", colour="Blue")

#another way to acheive same plot
t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating),
                   fill="white",
                   colour="Blue")

t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating),
                   fill="white",
                   colour="Blue")


#statistical transformations

?geom_smooth

u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

u+geom_point() + geom_smooth(fill=NA)


#boxplots
u <- ggplot(data = movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u+ geom_boxplot()
u+ geom_boxplot(size=1.2)
u+ geom_boxplot(size=1.2) + geom_point()

#tip for boxplots
u+ geom_boxplot() + geom_jitter() #jitter throws points randomly and give scope to unedrstand boxplot
#jitter powerful tool when used in combination of boxplot

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) # here alpha func manages transperancy of boxplot

#facets layering

v <- ggplot(data = movies, aes(x=BudgetMillions))
head(v)

v+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") #general example taken for facets

v+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")+
  facet_grid(Genre~., scales="free") #facet used to differentiate graphs seperately

#facets to scatterplots
w<- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w+ geom_point(size=2) #scatterplot

#facetting
w+ geom_point(size=2) +
  facet_grid(Genre~.) #this give individual graphs of each genre horizontally

w+ geom_point(size=2) +
  facet_grid(.~Year) # this gives combined graphs acc to year vertically

w+ geom_point(size=2) +
  facet_grid(Genre~Year)

w+ geom_point(size=2) +
  geom_smooth() +
  facet_grid(Genre~Year)


w+ geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

#coordinates

m <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
            size=BudgetMillions))
m+ geom_point(aes(colour=Genre))

#now i want only top critic rated movies
m+ geom_point(aes(colour=Genre)) + xlim(50,100) + ylim(50,100)

#this is good method but won't work always

#instead of that just zoomin using coord_cartesian function

n <- ggplot(data = movies, aes(x=BudgetMillions))

n + geom_histogram(binwidth= 10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth= 10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim = c(0,50)) #this is the zoomin layer

#improved facet grip chart example
w+ geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

#theme

o<- ggplot(data = movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#label formatting
h + xlab("Money Axis") + ylab("No.of Movies") +
  theme(axis.title.x = element_text(colour="Darkgreen", size=20),
        axis.title.y = element_text(colour="Red", size=20))

#tickmark formatting

h + xlab("Money Axis") + ylab("No.of Movies") +
  theme(axis.title.x = element_text(colour="Darkgreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10))

#legend formatting
h + xlab("Money Axis") + ylab("No.of Movies") +
  theme(axis.title.x = element_text(colour="Darkgreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1)) #this adjusts the position without any cuts

#title of plot formating
h + xlab("Money Axis") + ylab("No.of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="Darkgreen", size=20),
        axis.title.y = element_text(colour="Red", size=20),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=20,
                                  hjust = 0.5)) #here hjust function helps to align position of title


