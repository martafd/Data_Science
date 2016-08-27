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
