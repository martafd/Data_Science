## reshaping data
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c('carname', 'gear', 'cyl'), measure.vars = c('mpg', 'hp'))
head(carMelt, 5)

cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

spIns <- split(InsectSprays$count, InsectSprays$spray)
sum(spIns$A)
sprCount <- lapply(spIns, sum)
unlist(sprCount)
sprCount <- sapply(spIns, sum)*

ddply(InsectSprays, .(spray), summarize, sum = sum(count))
sprSums <- ddply(InsectSprays, .(spray), summarize, sum = ave(count, FUN = sum))
dim(sprSums)
head(sprSums)

## merging data 
fileUrl1 <- 'https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv'
fileUrl2 <- 'https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv'
download.file(fileUrl1, destfile = 'review.csv', method = 'curl')
download.file(fileUrl2, destfile = 'solution.csv', method = 'curl')
review <- read.csv('review.csv')
solution <- read.csv('solution.csv')
head(review)
head(solution)
names(review)
names(solution)

mergeData <- merge(review, solution, by.x = 'solution_id', by.y = 'id', all = TRUE)
head(mergeData)

intersect(names(solution), names(review))
mergeData2 <- merge(review, solution, all = TRUE)
head(mergeData2)

df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1, df2), id)

df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
df3 <- data.frame(id=sample(1:10), z=rnorm(10))
dfList <- list(df1,df2,df3)
join_all(dfList)
