library(httr)
myApp <- oauth_app('twitter', key = 'consumer_key', secret = 'consumer_secret')
sig <- sign_oauth1.0(myApp, token = 'token', token_secret = 'token_secret')
homeTL <- GET('http://api.twitter.com/1.1/statuses/home_timeline.json', sig)
## converting the json object
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1, 1:4]


library(httr)
library(httpuv)
library(dplyr)
library(jsonlite)
## setting the OAuth for github:
oauth_endpoints("github")
myapp <- oauth_app("github", key = "f62b85a733b6831b14f0", secret = "30352cc519a3d0647da7c47587062cc13f0ba5cf")
## get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
## using API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos:", gtoken)
stop_for_status(req)
output <- content(req)
jsonData <- jsonlite::fromJSON(toJSON(output))
head(jsonData)
jsonData[jsonData$message == 'jtleek/datasharing',]


setwd('/home/marta/Documents/Data_Science/3. Getting and Clearing Data/')
library(sqldf)
acs <- read.csv('getdata%2Fdata%2Fss06pid.csv') 
head(sqldf("select pwgtp1 from acs where AGEP < 50"))
sqldf("select distinct AGEP from acs")


url1 <- url('http://biostat.jhsph.edu/~jleek/contact.html')
htmlCode <- readLines(url1)
close(url1)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])
    

data <- read.fwf('getdata%2Fwksst8110.for', widths = w <- c(12, 7,4, 9,4, 9,4, 9,4), skip = 4)
head(data)
sum(data[, 4])
    