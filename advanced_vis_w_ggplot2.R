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

# ---------- Histograms and Density Charts ----------
s <- ggplot(data=movies, aes(x=BudgetMillions))

# histogram
# add colour and border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
  ylab("Frequency")

# density chart
s + geom_density(aes(fill=Genre), position="stack")

# ---------- Starting Layer Tips ----------
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="White", colour="Blue")
# humans behave in a normally distributed way!

# could have also been done as:
# gives extra flexibility
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, aes(x=AudienceRating),
                   fill="White", colour= "Blue")

t + geom_histogram(binwidth = 10, aes(x=CriticRating),
                    fill="White", colour= "Blue")

# can do this and add layers
t <- ggplot()

# ---------- Statistical Transformations ----------
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

# boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot(size=1) + geom_point()

# tip / hack : using geom_jitter with boxplots
u + geom_boxplot(size=1) + geom_jitter()
# another way
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)

# ---------- Using Facets ----------
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour= "Black")

# facets: create lots of charts
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour= "Black") +
  facet_grid(Genre~., scales="free") # genre for the rows

# scatter plots with facets
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=2) + facet_grid(Genre~.)
w + geom_point(size=2) + facet_grid(.~Year)
w + geom_point(size=1) + facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)
# ---------- Coordinates ----------
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))
m + geom_point() + xlim(50, 100) + ylim(50, 100)
# xlim and ylim will not always work

# zoom instead
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0, 50)) # zoomed into the chart

# zoom into scatterplot chart
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0,100))

# ---------- Perfecting By Adding Themes ----------
o <- ggplot(data=movies, aes(x=BudgetMillions))

# histogram
# add colour and border
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

# axes labels
h + xlab("Budget (Millions)") + 
  ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
    axis.title.y = element_text(colour="Red", size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    legend.title = element_text(size=20),
    legend.text = element_text(size=20),
    legend.position = c(1,1),
    legend.justification = c(1,1),
    plot.title = element_text(colour="DarkBlue", size=30, family= "Courier"))









