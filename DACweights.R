# y is a list of contribution in order of time the contribution is made,
# we want to only get the ones above 75k
y <- c(75000,75000,75000,75000,75000,75000,75000,75000,75000,75000,
       75000,75000)
# x is the list of contributions eligible for the refund bonus
x <- y[y>= 75000]
a <- 0.5 # this is the rate of decay, if you get closer to 1 then the bonus is 
# equally distributed, as you get to 0 everything goes to the first contributor 
w <- rep(0,length(x)) # just creates a empty vector of 0's
# the main for loop that returns the list of weights given 
# an exponential decay 
for (i in 1:length(x)) {
  w[i] <- a^i
}
# w_1 is the weights normalized so they sum to 1
w_1 <- w/sum(w) 
# we have the weights such that they sum to 1 in a decreasing sequence
# but we also need to give extra to the donors that donated more
# here we get w_2, the weights adjusted for different contribution amounts
w_2 <- (x*w_1)/sum(x*w_1)
# w_2 is normalized again to sum to 1
# RB is the total amount contributed to the refund bonus
RB <- 1000 # in this example 10k in refund bonus
RB_each <- round(RB*w_2,0) # rounds to zero decimal points the amount
# to be returned to each. This will sum to RB given W_2 sums to 1
round(w_1,2)
w_2
RB_each # returns each contribution 

