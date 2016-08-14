printmessage <- function(x){
    if(is.na(x))
        print('missing value')
    else
        print('x < 0')
    invisible(x)
}
printmessage(log(-1))

mean(y)
mean(c(4,5,5))
traceback()

lm(y~x)
traceback()


debug(lm)
lm(y~x)


options(error = recover)
read.csv('nosuchfile')
