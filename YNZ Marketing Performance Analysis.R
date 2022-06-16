#######################################

#MARKETING PERFORMANCE ANALYSIS USING R

#######################################


#load package Tidyverse
library(tidyverse)
library(lubridate)
library(PerformanceAnalytics)

#########
#LOAD DATASET
#########

#import Google Ads date from .csv file#
googleads <- read.csv("googleads.csv")

#########
#Data Cleaning
#########

##lower case channel
googleads$channel <- tolower(googleads$channel)

##check unique
unique(googleads$channel)

##change chr date to actual date
googleads$date <- dmy(googleads$date)

##create new column called week
googleads$week = lubridate::week(googleads$date)

##import nzyacon sales records
yaconsales <- read.csv("nzyacon_sales_by_date.csv")

##change yaconsales chr date to actual date
yaconsales$order_date <- ymd(yaconsales$order_date)

##create new column called week
yaconsales$week = lubridate::week(yaconsales$order_date)

##load clean data
adperf <- read.csv("adperformance.csv")

##Check Ad Performance and Correlation with Visual

chart.Correlation(adperf, histogram = TRUE, pch=19)
