setwd('/home/marta/Documents/Data_Science/3. Getting and Clearing Data')

fileUrl <- 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD'
download.file(fileUrl, destfile = './restaurants.csv', method = 'curl')
data <- read.csv('restaurants.csv')
head(data, 3)
tail(data, 3)
summary(data)
str(data)   ## structure
quantile(data$councilDistrict, na.rm = TRUE)
quantile(data$councilDistrict, probs = c(0.4, 0.7, 0.95))
table(data$zipCode, useNA = 'ifany')
table(data$councilDistrict, data$zipCode) ## to know relation between councilDistrict and zipCode
sum(is.na(data$councilDistrict))    ## check missing values
any(is.na(data$councilDistrict))
all(is.na(data$zipCode > 0))
colSums(is.na(data))
all(colSums(is.na(data)) == FALSE)
table(data$zipCode %in% c('21212'))
data[data$zipCode %in% c('21212'),]

data(UCBAdmissions)
df <- as.data.frame(UCBAdmissions)
summary(df)
xt <- xtabs(Freq ~ Gender + Admit, data = df)

warpbreaks$replicate <- rep(1:9, len = 54)
xt <- xtabs(breaks~., data = warpbreaks)
ftable(xt)

fakeData <- rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units = 'Mb')


data$nearMe <-data$zipCode %in% c('21212', '21213')
table(data$nearMe)
data$zipWrong <- ifelse(data$zipCode < 0, TRUE, FALSE) ## true if zipCode<0
table(data$zipWrong, data$zipCode < 0)

data$zipGroups <- cut(data$zipCode, breaks = quantile(data$zipCode))
table(data$zipGroups)
table(data$zipGroups, data$zipCode)

library(Hmisc)
data$zipGroups <- cut2(data$zipCode, g = 5)
table(data$zipGroups)

data$zcf <- factor(data$zipCode)
head(data$zcf, 10)
class(data$zcf)


yesno <- sample(c('yes', 'no'), size = 10, replace = TRUE)
yesnofactor <- factor(yesno, levels = c('yes', 'no'))
relevel(yesnofactor, ref = 'yes')
as.numeric(yesnofactor)

## using the mutate(changing) function
library(Hmisc)
library(plyr)
data2 <- mutate(data, zipGroups = cut2(zipCode, g =5))
table(data2$zipGroups)
