setwd('Documents/Data_Science/3. Getting and Clearing Data')

if(!file.exists('data')){
    dir.create('data')
}

## downloading data by link
fileUrl <- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'
download.file(fileUrl, destfile = './data/cameras.csv', method = 'curl')
list.files('./data/')
dateDownloaded <- date()
dateDownloaded
## reading csv file
cameraData <- read.table('./data/cameras.csv', sep = ',', header = TRUE)
cameraData <- read.csv('./data/cameras.csv')
head(cameraData)
    

##downloading data in excel
fileUrl <- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true'
download.file(fileUrl, destfile = './cameras.xlsx', method = 'curl', mode = 'wb')
## reading 
library(readxl)
cameraData <- read_excel('cameras.xlsx')
datasets <- system.file("data", "cameras.xlsx")
read_excel(datasets)
## another way 
cameraData <- readxl('./data/cameras.csv', sep = ',', header = TRUE)
head(cameraData)

 
## downloading XML file
library(XML)
fileUrl <- 'http://www.w3schools.com/xml/simple.xml'
## reading xml file
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE) ## визначає вузол і відкриває до нього доступ
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[2]][[1]]
xmlSApply(rootNode, xmlValue)


##           XPath
xpathSApply(rootNode, '//name', xmlValue)
xpathSApply(rootNode, '//price', xmlValue)


## extract content by attributes
fileUrl <- 'http://espn.go.com/nfl/team/_/name/bal/baltimore-revens'
fileUrl <- 'http://espn.go.com/nfl/team/roster/_/name/bal'

doc <-htmlTreeParse(fileUrl, useInternalNodes = TRUE) ## useinternalNodes is to get all nodes(elements) from file
scores <- xpathSApply(doc, '//ul[@class="ui-tabs"]', xmlValue)
scores
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
teams


## reading JSON
library(jsonlite)
jsonData <- fromJSON('https://api.github.com/users/jtleek/repos')
names(jsonData)
names(jsonData$owner)
jsonData$owner$id

## writing data frame to JSON
myjson <- toJSON(iris, pretty =TRUE)
cat(myjson)  ## Outputs the objects, concatenating the representations. cat performs much less conversion than print.

iris2 <- fromJSON(myjson)
head(iris2)

## using data.table
library(data.table)
df <- data.frame(x=rnorm(9), y= rep(c('a','b','c'), each = 3), z = rnorm(9))
dt <- data.table(x=rnorm(9), y= rep(c('a','b','c'), each = 3), z = rnorm(9))
tables()

dt[2, ]
dt[dt$y=='a']
dt[c(2,3)]  ##subset based on rows
dt[, c(2, 3)] ## result = 2, 3 that means line numbered

k = {print(10); 5} ## result 10
k  ## result 5
    
dt[, list(mean(x), sum(z))]
dt[, table(y)]
dt[, w := z^2]


dt2 <- dt   ## if you change a dt, dt2 will also change 
dt[, y := 2]

dt[, m := {tmp <- (x + z); log2(tmp + 5)}]
dt[, a := z > 0]
dt[, b := mean(x + w), by=a]

## special variables
set.seed(123)
dt <- data.table(x = sample(letters[1:3], 1E5, TRUE))
dt[, .N, by = x]            ## .N an integer, length 1, containing the number 


## keys
dt <- data.table(x=rep(c('a', 'b', 'c'), each =100), y = rnorm(300))
setkey(dt, x)
dt['c']

## joins
dt1 <- data.table(x=rep(c('a', 'a', 'b', 'dt1')), y = 1:4)
dt2 <- data.table(x=rep(c('a', 'b', 'dt2')), z = 5:7)
setkey(dt1, x)
setkey(dt2, x)
merge(dt1, dt2)


## fast reading
big_df <- data.frame(x = rnorm(1E3), y = norm(1E3))
    file <- tempfile()
write.table(big_df, file = file, row.names=FALSE, col.names = TRUE, sep = '\t', qoute = FALSE)
system.write(fread(file))
system.file(read.table(file, header = TRUE, sep = '\t'))