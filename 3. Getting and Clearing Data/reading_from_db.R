library(RMySQL)
ucscDb <- dbConnect(MySQL(), username ='genome', host ='genome-mysql.cse.ucsc.edu')
result <- dbGetQuery(ucscDb, 'show databases;');
dbDisconnect(ucscDb)
result

hg19 <- dbConnect(MySQL(), username ='genome', db= 'hg19', host ='genome-mysql.cse.ucsc.edu')
allTables <- dbListTables(hg19) ## to know all tables of db 'hg19'
length(allTables)
allTables[1:5]
dbListFields(hg19, 'affyU133Plus2') ## to know all fields in table 'affyU133Plus2'
dbGetQuery(hg19, 'select count(*) from affyU133Plus2') ## to know how many rows table 'affyU133Plus2' has

## to show table
affyData <- dbReadTable(hg19, 'affyU133Plus2')
head(affyData)  

## select a specific subset
query <- dbSendQuery(hg19, 'select * from affyU133Plus2 where misMatches between 1 and 2') ## it is select just for server
affyMis <- fetch(query)  ## send the select to db and get data to your pc
quantile(affyMis$misMatches) ##

affyMisSmall <- fetch(query, n = 10)
dbClearResult(query)
dim(affyMisSmall)
