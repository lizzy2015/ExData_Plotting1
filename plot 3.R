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

da=read.table("household_power_consumption.txt", sep=";", nrows=80000, header=T, stringsAsFactors=F, na.strings="?")


#convert date and time variables to Date/time class
da$Time=strptime(paste(da$Date, da$Time), "%d/%m/%Y %H:%M:%S")

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
#plot 3: illustrate the Sub_metering 
par(mfrow=c(1,1))

png("Plot3.png", width=400, height=400)
plot(da$Time , da$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(da$Time, da$Sub_metering_2, col="red")
lines(da$Time, da$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

dev.off()
