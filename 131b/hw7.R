Glucose1 = read.table("http://people.reed.edu/~jones/141/Glucose1.dat", header = TRUE)
Glucose2 = read.table("http://people.reed.edu/~jones/141/Glucose2.dat", header = TRUE)

A = Glucose1$test5
B = Glucose2$test2

summary(A)
summary(B)

A_length = length(A)  # 53
B_length = length(B)  # 52

qqnorm(A, main = "QQ plot for non-pregnant women")
qqline(A)  ## not normal, right-skew

qqnorm(B, main = "QQ plot for pregnant women")
qqline(B)  ## normal

# Test statistic
## Two-sided alternative:
V1 = var(A)/var(B)  # >1,  df = (52, 51)
V1

# p-value =
2*pf(V1,52,51,lower.tail=FALSE)

qf(0.995, 51, 52)
qf(0.005, 51, 52)

var.test(A, B, conf.level = 0.99, alternative="two.sided")



###################################

abar=mean(A)
abar
bbar=mean(B)
bbar
# Sample sizes:
m=length(A)  # 53
n=length(B)  # 52

# Pooled sample variance:
s2.pool = ((m-1)*var(A) + (n-1)*var(B))/(m+n-2)

## Test statistic:
U = (abar-bbar)/sqrt(s2.pool*(1/n+1/m))
U

## P-value:
pt(U,m+n-2)  # 0.01231833

## confidence interval
quant = qt(0.995, n+m-2)
(abar-bbar) + c(-1,1)*quant*sqrt((1/n+1/m)*s2.pool)

t.test(A, B, conf.level = 0.99, var.equal=TRUE, alternative = "less")


##################

qbeta(0.975, 19, 8)   # 0.856
qbeta(0.025, 19, 8)   # 0.522

binom.test(18, 25, conf.level = 0.95, alternative = "two.sided") $ conf.int[1:2]  
#  0.5061232 0.8792833





