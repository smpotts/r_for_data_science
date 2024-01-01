### Movie Domestic Growth ###
setwd("/Users/spotts/Projects/r_for_data_science")
mov <- read.csv("Section6-Homework-Data.csv")
head(mov)
str(mov)

# activate ggplot2
install.packages("ggplot2")
library (ggplot2)

# cool insight:
ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar() # most movies are released on Fridays
# never released on a Monday

# filters
filt <- (mov$Genre == "action") | mov$Genre == "adventure" | mov$Genre == "comedy" | mov$Genre == "drama"

filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")

mov2 <- mov[filt & filt2,]
mov2

# prepare plots data and aesthetics layers
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

# add geometries
q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) +
    geom_boxplot(alpha=0.7, outlier.colour=NA)

# non data ink
q <- q + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q

# theme
q <- q + 
  theme(
    axis.title.x = element_text(colour="Blue", size=10),
    axis.title.y = element_text(colour="Blue", size=10),
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=10),
    plot.title = element_text(size=20),
    legend.title = element_text(size=10),
    legend.text = element_text(size=10),
    text = element_text( family="Comic Sans MS")
  )
q

q$labels$size <- "Budget $M"













