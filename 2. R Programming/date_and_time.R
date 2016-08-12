##Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and
##'POSIXlt' classes. Internally, dates are stored as the number of days since 1970-01-01 and
##times are stored as either the number of seconds since 1970-01-01 (for 'POSIXct') or a
##list of seconds, minutes, hours, etc. (for 'POSIXlt').

## gettitng the current date and store it in the variable
d1 <- Sys.Date()

##Use the class() function to confirm d1 is a Date object.
class(d1)
##[1] "Date"

##We can use the unclass() function to see what d1 looks like internally.
unclass(d1)
##[1] 17025          That's the exact number of days since 1970-01-01!

## if you print d1 to the console, you'll get today's date -- YEAR-MONTH-DAY.
d1
##[1] "2016-08-12"

## You can access the current date and time
t1 <- Sys.time()
t1 
##[1] "2016-08-12 12:47:52 EEST"
class(t1)
##[1] "POSIXct" "POSIXt" 

##As mentioned earlier, POSIXct is just one of two ways that R represents time information.
##(You can ignore the second value above, POSIXt, which just functions as a common language
##between POSIXct and POSIXlt.) Use unclass() to see what t1 looks like internally -- the
##(large) number of seconds since the beginning of 1970.
unclass(t1)
##[1] 1470995273
##By default, Sys.time() returns an object of class POSIXct, but we can coerce the result to
##POSIXlt with as.POSIXlt(Sys.time()). Give it a try and store the result in t2.
t2 <- as.POSIXlt(Sys.time())
class(t2)
##[1] "POSIXlt" "POSIXt" 
t2
##[1] "2016-08-12 12:49:28 EEST"
unclass(t2)
## $sec
##[1] 28.12285
##
##$min
##[1] 49
##
##$hour
##[1] 12 and so on

##t2, like all POSIXlt objects, is just a list of values that make up the date and time. Use
##str(unclass(t2)) to have a more compact view.
str(unclass(t2))
##List of 11
##$ sec   : num 28.1
##$ min   : int 49
##$ hour  : int 12
## and so on
t2$min
##[1] 49

## Now that we have explored all three types of date and time objects, let's look at a few
## functions that extract useful information from any of these objects -- weekdays(),
## months(), and quarters().

##The weekdays() function will return the day of week from any date or time object. Try it
##out on d1, which is the Date object that contains today's date.
weekdays(d1)
##[1] "п'ятниця"

## The months() function also works on any date or time object. Try it on t1, which is the
## POSIXct object that contains the current time (well, it was the current time when you
## created it).
months(t1)
##[1] "серпень"

## The quarters() function returns the quarter of the year (Q1-Q4) from any date or time
## object. Try it on t2, which is the POSIXlt object that contains the time at which you
## created it.
quarters(t2)
##[1] "Q3"

## Often, the dates and times in a dataset will be in a format that R does not recognize. The
## strptime() function can be helpful in this situation.
##strptime() converts character vectors to POSIXlt. In that sense, it is similar to
##as.POSIXlt(), except that the input doesn't have to be in a particular format (YYYY-MM-DD).
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
##[1] NA
t4
##[1] NA
class(t4)
##[1] "POSIXlt" "POSIXt" 


Sys.time() > t1
##[1] TRUE

Sys.time() - t1
##Time difference of 7.655197 mins

##to control over the units when finding the above difference in times, you can use
##difftime(), which allows you to specify a 'units' parameter.
difftime(Sys.time(), t1, units = 'days')
##Time difference of 0.005844198 days