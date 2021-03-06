# Assignment: ASSIGNMENT 5
# Name: Brough, Jed
# Date: 2021-5-01

## Set the working directory to the root of your DSC 520 directory
setwd("~/Documents/Data/dsc520/data/r4ds")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("heights.csv")

## Using `cor()` compute correclation coefficients for
## height vs. earn
cor(heights_df$height, heights_df$earn)
# 0.2418481
### age vs. earn
cor(heights_df$age, heights_df$earn)
# 0.08100297
### ed vs. earn
cor(heights_df$ed, heights_df$earn)
# 0.3399765

## Spurious correlation
## The following is data on US spending on science, space, and technology in millions of today's dollars
## and Suicides by hanging strangulation and suffocation for the years 1999 to 2009
## Compute the correlation between these variables
tech_spending <- c(18079, 18594, 19753, 20734, 20831, 23029, 23597, 23584, 25525, 27731, 29449)
suicides <- c(5427, 5688, 6198, 6462, 6635, 7336, 7248, 7491, 8161, 8578, 9000)
cor(tech_spending,suicides)
# 0.9920817


students <- read.csv("student-survey.csv")

# i.
cov(students)
# this allows me to see a basic relationship between variables. positive values indicate a positive relationship and the same goes for negative.

# ii.
# covariance changes based on the unit of measurement being used. If we used time reading in minutes vs hours, the covariance would change
# a better option might be to calculate the correlation

# iii.
cor.test(students$TimeTV,students$Happiness, method = ("pearson"))
#the test estimates .63 as the correlation coefficient with a 95% confidence interval from 0.059 to 0.894. The confidence interval does not include 0 so I would say that the test shows positive correlation

# iv.
round(cor(students),2)
cor.test(students$TimeTV,students$Happiness, method = ("pearson"))
cor.test(students$TimeTV,students$Happiness, method = ("pearson"), conf.level = .99)
# the correlation matrix shows that time reading has a negative relationship with most variables and the relationship is really strong with time TV
# time TV has a positive relationship with all variables except for time reading.

# v.
round(cor(students),2)
round(cor(students),2)^2

# vi.
# I wouldn't say that the relationship between time reading and time tv is significant enough to assume causality but there does seem to be a strong relationship.

library(ppcor)
# vii.
pcor.test(students$TimeTV,students$Happiness,students$TimeReading, method = ("pearson"))
# controlling for time reading allows us to see the correlation between time TV and hapiness while taking into account and controlling for the time reading.