read.csv("Afghanistan.csv")
#read in dataset and sve to variable
gap <- read.csv("Afghanistan.csv")
#'<dataframe> <- read.csv("dataset")' creates a dataframe which is an R specific dataset which can contain both numbers and characters for specialized for R functionality.
?read.csv
help(read.csv)
#'?<command name>' or 'help(<command name>)' opens help for a particular command
#use tab complete to pull up additional or next options available
example(read.csv)
#example(<command name>) will display example script in console window
head(gap)
#head(<dataframe>) displays the first 6 lines of dataset; good for checking data for problems.
tail(gap)
#tail(<dataframe>) displays the last 6 lines of a dataset; good for checking data for problems.
nrow(gap)
#nrow(<dataframe>) displays the number of rows in the dataset.
ncol(gap)
#ncol(<dataframe>) displays the number of columns in the dataset.
dim(gap)
#dim(<dataframe>) displays the dimensions of the dataset
summary(gap)
#summary(<dataframe>) displays summary stats for the dataset (including mean, median, missing data, etc.)
str(gap)
#str(<dataframe>) displays the string info for the dataset
names(gap)
#names(<dataframe>) displays the column (variable) names in the dataset
gap$pop
#gap$<columnn name> displays the values of the data in the specified column
gap[4,5]
#<dataframe>[<row number>,<col number>] displays the value at that cell
life_1952 <- gap[4,5]
gap[1:4, 1:5]
#^ finds row#-row# and col#-col#
gap[c(3,5), c(2,5)]
#^ concatenate function
gap[,5]
#^ lists all of the data values for col 5
gap$lifeExp
#^ lists all of the data vlues for <variable>
mean(gap$lifeExp)
#^ basic mean function does not work with NA (missing data), must specify if missing values are present and to ignore missing values
?mean
#^ looking at mean function options to find command for skipping missing (NA) values
mean(gap$lifeExp, na.rm=TRUE)
#^ added 'na.rm=TRUE' to turn the na.rm (NA remove) on; must specify TRUE (all caps)
life_mean <- mean(gap$lifeExp, na.rm=TRUE)
#^ creates a single value variable which can be used in subsequent calcuations and/or data scripts
life_mean
#^ displays value of variable
plot(gap$year, gap$lifeExp)
#^ plots data according to variable specfication; plot(<dataframe>$<colname>, <dataframe$<colname>)
plot(gap$year, gap$pop)
?plot
#^ use ?<function> to find additional function options
#Additional note: all functions have () following function name
plot(gap$year, gap$pop, main='Population by year', col='blue', xlab='Year', ylab='Population', pch= 15)
#^ used plot() options to change plot title, axis labels, color, etc.
#'pch' refers to plotting character; used to change display options
#Additional note: Use 'Export' option in the plot tab to export plot image to pdf, jpeg, etc.
add_function <-function(x,y) {x+y}
#^creating customized function for routine and/or special operations. <function name> <-function(<variable1>,<variable2>) {desired operation}
add_function(3,4)
#^runs designated function and displays the result of the operation. So, <funtion name>(<specfied variables>) then R performs pre-defined operation of the function.
plot_function <- function(x,y) {plot(x,y, col="blue", pch=16, xlab="Year", ylab="Population", main="Population by year")}
plot_function(gap$year, gap$pop)
#^example of a plot function for creating a series of standardlized or commonly-used plots
