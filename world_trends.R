setwd("/Users/spotts/Projects/r_for_data_science")
data <- read.csv("P2-Section5-Homework-Data.csv")
data
head(data)
str(data)
summary(data)

data$Year
temp <- factor(data$Year)
temp

# filter the data frame
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]
nrow(data1960)
nrow(data2013)

# create the additional data frames
add1960 <- data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

# check summaries
summary(add1960)
summary(add2013)

# merged the pairs of data frames
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Country")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Country")
str(merged1960)

# delete colulmns
merged1960$Year <- NULL
merged2013$Year <- NULL

# visualizations
library(ggplot2)

qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp, colour=Region, alpha=I(0.6), main="Life Expectancy vs Fertility (1960")
qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp, colour=Region, alpha=I(0.6), main="Life Expectancy vs Fertility (2013")




