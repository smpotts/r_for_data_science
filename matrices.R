### Matrices ###
# bends a vector into a matrix

my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5) # col and rows have to multiple to # elts
A

A[2,3]

B <- matrix(my.data, 4, 5, byrow=T)
B

#rbind()
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)
C <- rbind(r1, r2, r3)
C

#cbind()
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1, c2)
# colnames() and rownames()
colnames(D) <- c("v1", "v2")
rownames(D) <- c("x1", "x2", "x3", "x4", "x5")
D

# named vectors
Charlie <- 1:5
Charlie

# give names
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie

Charlie["d"]
names(Charlie)

# clear names
names(Charlie) <- NULL

# -------------
# naming matrix dimensions 1
temp.vec <- rep(c("a", "B", "zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

# column and row names
rownames(Bravo) <- c("How", "are", "you")
colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are", "Y"] <- 0
Bravo

### Subsetting ###
x <- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]
# we are actually subsetting the vector x ^^

Games
Games[1:3, 6:10] # subset of a matrix
Games[c(1,10),] # selecting two rows
Games [, c("2008", "2009")] # selecting two columns
Games[1,] # this is a vector
# what's going on?
# R is trying to guess what you want, since obj is not two dimensional, it returns a vector

Games[1,,drop=F] # drops unnecessary dimensions
# by default drop=T and would drop dims from 2 -> 1
# R will guess what you want if you don't specify drop





