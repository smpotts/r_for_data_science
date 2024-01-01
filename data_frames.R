# method 1 : select the file manually
stats <- read.csv(file.choose())

# method 2 : set wd and read data from there
setwd("/Users/spotts/Projects/r_for_data_science")
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv", stringsAsFactors = T)
stats

# ----------------exploring data
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
# structure
str(stats) #str() runif()

#runif() : random variables distributed uniformally

# break downs to see different distributions
summary(stats)

# -----------------
stats
stats[3,3]
stats[3, "Birth.rate"]
# $ works for data frames but not matrices
stats$Internet.users
stats$Internet.users[2]
stats[, "Internet.users"]

levels(stats$Income.Group)

# ---------------- Basic operations with a DF
# subsetting
stats[1:10,]
stats[3:9,]
stats[c(4, 100),]

# remember how the [] work:
stats[1,]
is.data.frame(stats[1,])
# no need for drop=F for data frames unless you are extracting a column
stats[,1]
is.data.frame(stats[,1])
is.data.frame(stats[,1, drop=F])

# add and multiply columns
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats

stats$xyz <- 1:5 # vector recycling, has to be a multiple of the vector length
head(stats, n=12)

# remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
stats

# ---------------------- Filtering data frames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]

stats[stats$Country.Name == "Malta",]

# ----------------------- Introduction to qplot
install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

# ----------------------- Visualizing what we need
qplot(data=stats, x= Internet.users, y=Birth.rate)
qplot(data=stats, x= Internet.users, y=Birth.rate, size=I(2), colour=I("red"))
# displaying the income group by color
qplot(data=stats, x= Internet.users, y=Birth.rate, size=I(2), colour=Income.Group)

# ------------------------ Building data frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Codes=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)

# ------------------------ Merging data frames
head(stats)
head(mydf)

merged <- merge(x=stats, y=mydf, by.x = "Country.Code", by.y = "Codes") # basically the field you are joining on in both data frames
head(merged)
merged$Country <- NULL
str(merged)

# ------------------------ Visualizing with Qplot with new splits
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region)

# 1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, size=I(3), shape=I(17))

# 2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, size=I(3), shape=I(17), alpha=I(0.7))

# 3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Region, size=I(3), shape=I(17), alpha=I(0.7), main = "Birth Rate vs Internet Users")











