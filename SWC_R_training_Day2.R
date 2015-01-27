install.packages("ggplot2", dependencies=TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

library("ggplot2") #Library("<packagename>") loads the script package into memory for this R session. To use in subsequent session you must re-load packages.
library("plyr")
library("ggthemes")
library("reshape2")

#You can also use the package tab to install and load script packages. Writing in the scripting documents which packages are loaded and automatically loads the correct packages when you need to run the analyses again.

#The Grammar of ggplot
#Data (data)- for ggplot, data must be in a data.frame

head(iris) #iris is a sample dataset built into R
#for chopping up datasets, look into plyr
#for change data formats, look into reshape2

#reshape2 example with melt
iris[1:2, ]
df <- melt(iris, id.vars = "Species") #melt- transposes the dataset, into a long vs. wide format (think pivot table)
df[1:2, ]

#Aesthetics (aes)- how your data are represented visually (making it pretty)
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

#Geometry (geom)- the geometric object in the plot
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()

#'myplot <-' sends the command to the console, remove when plotting to actually plot

#add options, in the following case, color to the aes and in the geom setting the size of the points
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(size = 3)

#Within geom, can add aes changes; in this case, change the shape of the points based on the species
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(aes(shape = Species), size = 3)

#ggplot Exercise 1- Make a plot based on a small sample of the diamonds dataset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ] #From the embedded 'Diamonds' data set, this command is taking a random sample of the diamonds dataset
ggplot(data = d2, aes(x = carat, y= price, color = color)) + geom_point(size = 3)

#Stats (stats)= statistical transformations and data summary

library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot() 
#In aes, 'factor(<variable>)' is taking all of the values in that group and making a boxplot. Therefore, it is taking all of the values for each race and calculating the median, Q1, Q3 and outliers and displaying that data in a boxplot

myplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot() 
summary(myplot)

#Facets (facets)= Subsetting data to make lattice plots
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  facet_grid(Species ~ .)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  facet_grid(. ~ Species)

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() + 
  facet_wrap(~ Species) #facet_wrap does not need '.'

#Scales (scales)= Control the mapping from data to aestheics; often used for color changes
aes(color = variable) #mapping to a specific variable
color = black #setting to a specific color
scale_fill_manual(values = c("color1", "color2"))

library(RColorBrewer) #color selections assistant
display.brewer.all() #displays all of the colors available

df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")
#for aes, you are specifying that the x-axis is species and each bar is the value of each variable
#for geom, you are setting the stat is identity and position 'dodge' makes the bars dodge each other and do not overlay each other
#for scale, you are using the brewer to use a customized color set (Set 1 from the Colorbrewer)
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) +
  geom_boxplot(width = .2) +
  scale_y_continuous(labels = (paste0(1:4, " Kg")), breaks = seq(1000, 4000, by = 1000))

#Coordinates (coord)= polar coordinate plots; not covered in training

#Histograms
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, fill = "steelblue", colour= "black")

#Barplots
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "identity")
#This is incorrect, because it's stacking all of the observations in each category

#Exercise 2- Using the d2 dataset to generate a plot. Take a quick look at the data first to see if it needs to be binned.
ggplot(d2, aes(clarity, fill = cut)) + 
  geom_bar(stat="bin", position = "dodge") +
  scale_fill_brewer(palette = "Set1")
#'fill=<variable>' fills the x-axis categories with an additional subset
#'stat=<stat option>' is not always necessary, in this case, because there were not other options, ggplot would have defaulted to 'bin' which is just a count of observations

#Themes are global changes with change the overall look of the plot. Can design custom themes to reporting or journal requirements.
#There are a wide variety of themes available (excel, Stata, Wes Anderson, etc.)

#Creating functions to automate your plotting
#Example:
my_custom_plot <- function(df, title = "", ...) {
ggplot(df, ...) +
  ggtitle(title) +
  whatever_geoms() +
  theme(...)
}

#Saving your plots:
#ggsave(<path>.<extension>) to save your plots. Can add options to specify size.



