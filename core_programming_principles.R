# Core Programming Principles
# https://www.superdatascience.com/pages/rcourse

# integer
x <- 2L
typeof(x)

# double
y <- 3.9
typeof(y)
# by default R will decide for you how it is going to store the data, chooses a double by default

# complex numbers
z <- 3 + 2i
typeof(z)

# character
a <- "h"
typeof(a)

# logical
q1 <- TRUE
q2 <- F
typeof(q1)

A <- 10
B <- 5
C <- A + B

var1 <- 2.5
var2 <- 4
result <- var1 / var2
result

answer <- sqrt(var2)
answer

greeting <- "Hello"
name <- "Shelby"
message <- paste(greeting, name)
message

# logical:
# TRUE or FALSE, T or F
4 == 5
4 != 5
4 < 5
4 > 5
4 | 5

result <- 4 < 5
result
typeof(result)

result2 <- !TRUE
result2 <- !(5 > 1)
result2

result | result2
result & result2

# while loops
x <- 5
while(x > 0){
  x <- x - 1
  print(x)
}

# 1:5 is a vector of numbers, or similar to an array
for(i in 1:5) {
  print("Hello, World")
}

for(i in 5:10) {
  print("Hello, World")
}

for(i in 1:5) {
  print(i)
}


# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----
x <- rnorm(1) # generates random numbers, specify normal distribution
rm(x) # removes variable assignment

if(x < 0){
  print("negative")
} else {
  print("positive")
}













