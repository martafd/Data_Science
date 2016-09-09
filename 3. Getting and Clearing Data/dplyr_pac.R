library(dplyr)
data <- mtcars
dim(data)
str(data)
names(data)
head(select(data, cyl:hp)) ## select columns cyl:hp from data
head(select(data, -(cyl:hp)))  ## select columns except cyl:hp from data
## without dpyr package:
i <- match('cyl', names(data)) ## equivalent to     head(select(data, -(cyl:hp))) 
j <- match('hp', names(data))
head(data[, -(i:j)])

datafilt <- filter(data, drat > 4 & wt > 2)

data <- arrange(data, mpg) ## order by mpg
arrange(data, desc(mpg))

data <- rename(data, display = disp, cylinder = cyl)

data <- mutate(data, newvar = mpg - mean(mpg, na.rm = TRUE))
head(select(data, mpg, newvar))

data <- mutate(data, temphp =factor(1*(hp > 250), labels = c('under', 'above')))
underabove <-group_by(data, temphp)
summarise(underabove, mpg = mean(mpg), qsec= max(qsec), wt = median(wt))

data <- mutate(data, year = as.POSIXlt(date)$year + 1900)
years <- group_by(data, year)
summarize(years, mpg = mean(mpg), qsec= max(qsec), wt = median(wt))

data %>% mutate(hp1 = hp + 3) %>% group_by(hp1) %>% summarize(mpg = mean(mpg), qsec= max(qsec), wt = median(wt))
