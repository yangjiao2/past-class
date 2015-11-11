###############
#size: significant level
pbinom(10, 20, 0.75)
pbinom(11, 20, 0.75)
pbinom(12, 20, 0.75)
# 11 + 1
n = 20
p = 0.25
c = 11

pbinom(c, n, p = 0.7)
pbinom(c, n, p = 0.65)
pbinom(c, n, p = 0.5)
pbinom(c, n, p = 0.25)
pbinom(c, n, p = 0.1)


pow = function(x, n, c, p0 = 0.5){
	# Calculate power for true probability p = x given
	# values of n and c and null value p0 (set to 0.5 as default):
	return(pbinom(n*(p0-c), n, x))
}

c = 0.4
x = c(0,1)
y = c(0,1)
plot(x, y, xlab="p", ylab="Power function",
	main="Sample size = 20") # Set up plot window
curve(pow(x, 20, c), add=T, lty=1) 
curve(pow(x, 50, c), add=T, lty=2) 
curve(pow(x, 100, c), add=T, lty=3) 
legend(0.1, 0.9, c("n = 20", "n = 50", "n = 100"), lty = c(1, 2, 3))



##################

Berkeley = read.table("http://www.reed.edu/~jones/141/Berkeley.dat",header=T)

attach(Berkeley)
t.test(ht2~sex, var.equal = TRUE, mu = 0, alternative = "two.sided")

# fail to reject null

Male = var(ht2[sex == "Male"])
Female = var(ht2[sex == "Female"])
Male
Female
sqrt(var(ht2))

power.t.test(n=NULL, delta=1, sd=3.3, sig.level=0.05, power=0.5)
power.t.test(n=NULL, delta=1, sd=3.3, sig.level=0.05, power=0.8)
power.t.test(n=NULL, delta=1, sd=3.3, sig.level=0.05, power=0.95)
power.t.test(n=NULL, delta=2, sd=3.3, sig.level=0.05, power=0.5)
power.t.test(n=NULL, delta=2, sd=3.3, sig.level=0.05, power=0.8)
power.t.test(n=NULL, delta=2, sd=3.3, sig.level=0.05, power=0.95)


