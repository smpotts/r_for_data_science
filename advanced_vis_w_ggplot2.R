# ---------- Advanced Visualization with GGPlot2 ----------
setwd("/Users/spotts/Projects/r_for_data_science")

movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = T)
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
str(movies)
# factor is a categorical variable

summary(movies)
# we want year to be a categorical variable, or a "factor"
movies$Year <- factor(movies$Year)

# ---------- Aesthetics ----------
library(ggplot2)
# aesthetics is how data maps to what you want to see
# have to introduce geometry layer to see anything
# add a new layer on a new line
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) + 
  # geometry
  geom_point()

# ---------- Plotting with Layers ----------
# can save ggplot as an object
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) 
# plotting with layers:
p + geom_point()

# multiple layers
p + geom_line() + geom_point()

# ---------- Overriding Aesthetics ----------
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))
# inheriting aesthetics from q
q + geom_point()
# overriding aesthetics
q + geom_point(aes(size=CriticRating))

q + geom_point(aes(colour=BudgetMillions))
# q stays as it was because we are not reassigning it
# can also override x and y
q + geom_point(aes(x=BudgetMillions)) + # x axis still has the old name
  xlab("Budget Millions ($)")

q + geom_line() + geom_point()
# reduce line size
q + geom_line(size=1) + geom_point() # setting aesthetics

# ---------- Mapping vs Setting ----------
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()
# add colour
# 1. by mapping
r + geom_point(aes(colour=Genre)) # map colour to a variable
# 2. setting
r + geom_point(colour="DarkGreen") # set the colour

r + geom_point(aes(size=BudgetMillions))
r + geom_point(size=2)













