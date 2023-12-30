### The Power of Vectorized Operations ###
x <- rnorm(5)

# R specific programming loop
for(i in x) {
  print(i)
}

print(x[1])

# conventional programming loop
for(j in 1:5) {
  print(x[j])
}

# -------------------
# compare vectorized and non-vectorized operations
N <- 100000
a <- rnorm(N)
b <- rnorm(N)

# vectorized approach
# way faster
c <- a * b

# devectorized approach
d <- rep(NA, N) # empty vector allocating memory

for (i in 1:N) {
  d[i] <- a[i] * b[i]
}
# R is acting as a wrapper for another language like C or Fortran




