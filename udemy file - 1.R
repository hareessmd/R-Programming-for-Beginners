mydata <- read.csv(file.choose()) #to choose downloaded file
install.packages("ggplot2") #installing ggplot package

#make ggplot2 in use or type library(ggplot2)

ggplot(data=mydata[mydata$carat<2.5,], aes(x=carat, y=price, colour = clarity))+
  geom_point(alpha=0.1)+
  geom_smooth()  #this will give you a scatter plot

