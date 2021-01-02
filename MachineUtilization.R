#Lists in R

#Deliverable - a list with the following components:
#Character: Machine name
#Vector: (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical: Has utlization ever fallen below 90% ?  TRUE/FALSE
#Vector: All hours were utlization is unkown (NA's)
#Dataframe: For this machine
#Plot: For all machine

util <- read.csv(file.choose())
head(util, 12)
str(util)
summary(util)

#Derive Utilization column
util$Utilization = 1 - util$Percent.Idle

#Handling Date-Times in R
POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
#How to rearrange columns in df:
util$Timestamp <- NULL
util <- util[,c(4, 1, 2, 3)]
