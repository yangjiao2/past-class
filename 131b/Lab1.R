# 1
# Will return value of the Monte Carlo approximation 
# the integral, and then the true value, which is 3*pi/16.
n = 100000
x=runif(n)
gx=(1-x^2)^(3/2)
est=mean(gx)
est
3*pi/16


# 2
# Will return value of the Monte Carlo approximation 
# the integral. This does not have a closed form solution,
# but should get around 93 for this integral based on other 
# approximtation methods.
n = 100000 
x=runif(n,-2,2)
gx=exp(x+x^2)
est=4*mean(gx)
est

# 3
# Draw from uniform(0,1) for x and y
# Then calcultate the proportion in the unit circle (pi/4)
# Then multiply by 4 and return that estimate to get pi 
# approximation
n = 100000
x=runif(n)
y=runif(n)
prop = sum((x)^2+(y)^2<1)/n
4*prop



# Now do this 1000 times and store each approximation
# Then take the mean and std. deviation of those 1000 values
pi.stor=NULL
for(i in 1:1000){
 	x=runif(n)
 	y=runif(n)
 	pi.stor[i]=4*sum((x)^2+(y)^2<1)/n} 	
mean(pi.stor)
sd(pi.stor)

# Can copy and paste this plot into word document.
hist(pi.stor, main = "Histogram of pi approximations")






