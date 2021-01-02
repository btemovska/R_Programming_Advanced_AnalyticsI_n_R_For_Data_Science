#Lists in R - data object it can contain any data types

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

#--------------------------Handling Date-Times in R
POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
#How to rearrange columns in df:
util$Timestamp <- NULL
util <- util[,c(4, 1, 2, 3)]

#-------------------------What is a list?
RL1 <- util[util$Machine == "RL1", ]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)

#construct list
#Character: Machine Name => we know it is RL1
#Vector: (min, mean, max) Utilization for the month (excluding unknown hours)
util_stats_rl1 <- c(min(RL1$Utilization, na.rm=T),
                    mean(RL1$Utilization, na.rm=T),
                    max(RL1$Utilization, na.rm=T))
util_stats_rl1 #0.8492262 0.9516976 0.9950000
#Logical: Has utlization ever fallen below 90% ?  TRUE/FALSE
length(which(RL1$Utilization < 0.90)) #which rows have fallen below 90% (27 times)

util_under_90 <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90 #TRUE
#construct list
list_rl1 <- list("RL1", util_stats_rl1, util_under_90) #Machine Name, min, mean, max, & logical
list_rl1
#[[1]]
# [1] "RL1"
# 
# [[2]]
# [1] 0.8492262 0.9516976 0.9950000
# 
# [[3]]
# [1] TRUE

#---------------------------------Naming components of a list
names(list_rl1) #NULL
names(list_rl1) <- c("Machine", "MinMeanMax", "LowThreshold")
list_rl1
#another way or renaming
rm(list_rl1)
list_rl1 <- list(Machine="RL1", MinMeanMax=util_stats_rl1, LowThreshold=util_under_90)
list_rl1
# $Machine
# [1] "RL1"
# 
# $MinMeanMax
# [1] 0.8492262 0.9516976 0.9950000
# 
# $LowThreshold
# [1] TRUE

#--------------------------------Extract components lists: [] vs [[]] vs $
#there are 3 ways
#[] - will always return a list
list_rl1[1]
  #$Machine
# [1] "RL1"
list_rl1[2]
# $MinMeanMax
# [1] 0.8492262 0.9516976 0.9950000

#[[]] - will always return the actual object
list_rl1[[1]] #RL1
list_rl1[[2]] #0.8492262 0.9516976 0.9950000

#$ - same as [[]] but prettier
list_rl1$Machine #RL1
list_rl1$MinMeanMax #0.8492262 0.9516976 0.9950000

typeof(list_rl1) #list

#how to access the 3rd element of the vector (max)
list_rl1$MinMeanMax[3] # 0.995


#------------------------------Adding/Deleting components
list_rl1
list_rl1[4] <- "New Information"
#another way
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
#$Machine
# [1] "RL1"
# 
# $MinMeanMax
# [1] 0.8492262 0.9516976 0.9950000
# 
# $LowThreshold
# [1] TRUE
# 
# [[4]]
# [1] "New Information"
# 
# $UnknownHours
# [1] "2016-09-01 00:00:00 EDT" "2016-09-01 01:00:00 EDT" "2016-09-01 02:00:00 EDT" 
#"2016-09-01 03:00:00 EDT" "2016-09-01 04:00:00 EDT" "2016-09-01 05:00:00 EDT" "2016-09-01 06:00:00 EDT"

#----delete component
list_rl1[4] <- NULL
# $Machine
# [1] "RL1"
# 
# $MinMeanMax
# [1] 0.8492262 0.9516976 0.9950000
# 
# $LowThreshold
# [1] TRUE
# 
# $UnknownHours
# [1] "2016-09-01 00:00:00 EDT" "2016-09-01 01:00:00 EDT" "2016-09-01 02:00:00 EDT" 
#"2016-09-01 03:00:00 EDT" "2016-09-01 04:00:00 EDT" "2016-09-01 05:00:00 EDT" "2016-09-01 06:00:00 EDT"


#---add another component - #Dataframe: For this machine
list_rl1$Data <- RL1
summary(list_rl1)


#----------------------Subsetting a list




