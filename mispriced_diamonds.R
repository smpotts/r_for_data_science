### Mispriced Diamonds

mydata <- read.csv(file.choose())

install.packages("ggplot2")

library(ggplot2) # needed to add this

# create a scatter plot
ggplot(data=mydata[mydata$carat<2.5,], aes(x=carat, y=price, colour=clarity)) + 
  geom_point(alpha=0.1) +
  geom_smooth()

# wherever the lines are crossing means there is mispricing
# can see where the diamonds are being purchased