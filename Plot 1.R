#Project 1 for Explortory Data Analysis
#10/11/2015

rm(list=ls())
library(reshape)

#set up directory
setwd("C:/Users/Liz Li/Documents/Liz Documents/Coursera/Explortory Analysis/Project 1")


#########################################################
################### Data Prep ###########################
#########################################################
#load data (only load part of the data b/c the raw data is huge)

da=read.table("household_power_consumption.txt", sep=";", nrows=80000, header=T, stringsAsFactors=F)

#convert Date
da$Date=as.Date(da$Date, format="%d/%m/%Y")

summary(da$Date)

#selection Data from 2007/02/01 to 2007/02/02
da=subset(da, Date>="2007-02-01" & Date<="2007-02-02")

#convert these variables from characters into numeric
for (i in c(3:8)) {da[,i]=as.numeric(da[,i]) }


#########################################################
###################### Plot #############################
#########################################################
#plot the first plot, it's a histgram, illustrating the frequency of Global Active Power. 


png("plot1.png", width=400, height=400)
par(mfrow=c(1,1))
hist(da$Global_active_power,
     main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="red", ylim=c(0, 1200))
dev.off()


