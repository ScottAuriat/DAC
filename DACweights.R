# y is a list of contribution in order of time the contribution is made,
# we want to only get the ones above 75k
y <- c(75000,75000)
# x is the list of contributions eligible for the refund bonus
x <- y[y>= 75000]

# Below is a rate of decay based on the order of when they pledged
a <- 0.5 # this is the rate of decay, if you get closer to 1 then the bonus is 
# equally distributed, as you get to 0 everything goes to the first contributor 
w <- rep(0,length(x)) # just creates a empty vector of 0's
# the main for loop that returns the list of weights given 
# an exponential decay 
xcount <- c(1:length(x))
ETH <- 2000
w <- a^xcount*ETH
RB_each <- round(w*x/sum(w*x)*RB,0)
RB_each


# Below is a rate of decay based on time from contribution to the end of the 
#campaign 
# we then need a vector of time stamps for each contribution that counts
# up  from  zero to the end, if by hours and we have ten days it would be 240 hours
xt <- c(1,240) # this example the first donation is in the first hour
# the second is in the final hour
a <- 0.99 # this is the rate of decay, if you get closer to 1 then the bonus is 
# equally distributed, as you get to 0 everything goes to the first contributor.
# Given we will use 240 time stamps roughly, this will be much closer to 1. 
# the main for loop that returns the list of weights given 
w <- rep(0,length(x)) # just creates a empty vector of 0's
ETH <- 2000  # multiply by an ETH
w <- a^xt*ETH
RB_each <- round(w*x/sum(w*x)*RB,0)
RB_each
# The first should bet 9179 and the last 830 given they donated the same amount
# but it will a adjust depending on the donation 