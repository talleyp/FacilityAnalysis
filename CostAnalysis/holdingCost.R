# Use cost CSV, divide them by the sum in order to make it all within [0,1]
# Then find max of a holding area
# Use this multiply by assumed cost of $700,000 by area of a gaylord (48x48 in^2)

rotate <- function(x) apply(t(x),1,rev)
totalArea <- 1884*4124
fCost <- 700000
gArea <- 48*48

## Load data
nochange <- as.matrix(read.table("costNoChange.csv", sep=","))
#nochange <- rotate(nochange)
noNorm <- nochange / sum(nochange) #Normalize

flip <- as.matrix(read.table("costFlipWS.csv", sep=","))
#flip <- rotate(flip)
flipNorm <- flip / sum(flip)

fullchange <- as.matrix(read.table("costFullChange.csv", sep=","))
#fullchange <- rotate(fullchange)
fullNorm <- fullchange / sum(fullchange)

# TV areas
tvNochangeRow <- c((48*21):(48*29),1:(6*48))
tvNochangeCol <- c((30*48):(62*48))

tvFullRow <- c(1:(48*3), 1:(48*16))
tvFullCol <- c((30*48):(62*48),(10*48):(26*48))

noChangeCost <- mean(tail(sort(noNorm[tvNochangeRow,tvNochangeCol]),50)) * fCost * gArea / 365 
## $31.89 / (year*gaylord)

fullCost <- mean(tail(sort(fullNorm[tvNochangeRow,tvNochangeCol]),50)) * fCost * gArea / 365 
## 12.02 / (year*gaylord)