# y is a list of contribution in order of time the contribution is made,
# we want to only get the ones above 75k
y <- c(75000,10,100000,75000,100000,75000,75000)
x <- y[y>= 75000]
# x is the list of contributions eligible for the refund bonus

a <- 0.5 # this is the rate of decay, if you get closer to 1 then the bonus is 
# equally distributed, as you get to 0 everything goes to the first contributor 

w <- rep(0,length(x))
for (i in 1:length(x)) {
  w[i] <- a^i
}
w_1 <- w/sum(w) # the weights that are not re-weighted for contribution

# we have the weights such that they sum to 1 but we also need to give
# extra to the donors that donated more
# here we get w_2, the weights adjusted for different contribution amounts
w_2 <- (x*w_1)/sum(x*w_1)

# RB is the total amount contributed to the refund bonus
# in this example 30k
RB <- 10000
RB_each <- round(RB*w_2,0)
RB_each

