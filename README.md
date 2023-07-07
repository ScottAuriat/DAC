# DAC
Code for dominant assurance contracts. The basic idea is to use exponential decay, where contributions are weighted based on how early and how much they were made. There is no timestamp, but rather the order of contributions determines their weight. The decay is based on the length of a vector of contributions.

Additional idea would be to base the decay on a time stamp. This would spread it out more. Given you made a contribution an hour after the first could not be treated the same as if it was a week later 

