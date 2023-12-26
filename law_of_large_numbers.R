### Law of Large Numbers ###
# Xn -> E(X) when n -> infinity
# average of X across a sample of n -> expected value of X

# normal distribution : 
# rnorm() generated a number around 0 and was less probable when further away
N <- 100000
counter <- 0

for(i in rnorm(N)) {
  if(i > -1 & i < 1) {
    counter <- counter + 1
  }  
}
counter / N

# compare to 68.2%



