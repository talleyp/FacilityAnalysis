# Use cost CSV, divide them by the sum in order to make it all within [0,1]
# Then find max of a holding area
# Use this multiply by assumed cost of $700,000 by area of a gaylord (48x48 in^2)

rotate <- function(x) apply(t(x),1,rev)
# totalArea <- 1884*4124
fCost <- 700000
gArea <- 48*48

## Load data
nochange <- as.matrix(read.table("costNoChange.csv", sep=","))
nochange <- rotate(nochange)
noNorm <- nochange / sum(nochange) #Normalize

flip <- as.matrix(read.table("costFlipWS.csv", sep=","))
flip <- rotate(flip)
flipNorm <- flip / sum(flip)

fullchange <- as.matrix(read.table("costFullChange.csv", sep=","))
fullchange <- rotate(fullchange)
fullNorm <- fullchange / sum(fullchange)

# TV areas
tvNochangeRow <- c(sum(328,326,326,327,36):sum(328,326,326,372,394),
                   1:328)
tvNochangeCol <- c(sum(205,233,208):sum(205,233,233,277,265,265), 
                   sum(205,233,233,277,265,265):sum(205,233,233,277,265,265,281,286,282,289,288,285))

noChangeCost <- max(noNorm[tvNochangeRow,tvNochangeCol]) * fCost * gArea / 365
## $2.36 / (year*gaylord)