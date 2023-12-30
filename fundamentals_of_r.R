### Fundamentals of R ###

MyFirstVector <- c(3, 45, 56, 732) # c puts the numbers into a vector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)

V2 <- c(3L, 12L, 42L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c("a", "B23", "Hello", 7)
is.character(v3)
# within a vector you can only have elements of the same type

# sequence
seq(1, 15)
# same as:
1:15

seq(1,15,2) # can set steps

z <- seq(1,15,4)
z

# replicate
rep(3, 50)
d <- rep(3.50)
rep("shelby", 50)

x <- c(80, 20)
y <- rep(x, 10)
y

w <- c("a", "b", "c", "d", "e")
w[1] # access an element within a vector, starting with 1

w[-1] # all except the first one
w[-3] # all except the third one
w[1:3] # getting a subset

w[c(1,3,5)] # getting elements from the w vector

# vector arithmetic
v1 <- c(1,0,0)
v2 <- c(0,1,0)
v3 <- c(0,0,1)
I <- v1 + v2 + v3
I

# recycling of vectors
v1 <- c(0, 8, -1, 3)
v2 <- c(-2, 4)  # will repeat smaller vector
v1 + v2
# will give a warning if smaller one is not a multiple of the larger one
v1 <- c(1,5,6,3,2)
v2 <- c(9,6)
v1 + v2

# vectors can be input and output of functions

### Functions ###
?rnorm() # to pull up docs on a function

rnorm(5, 10, 8)

x <- c("a", "b", "c")
seq(from=10, to=20, length.out=100)
seq(from=10, to=20, along.with=x)
rep(x, times=5)

### Packages ###
install.packages("ggplot2")
library(ggplot2)


