#Import data
Chicago <- read.csv(file.choose(), row.names = 1)
NewYork <- read.csv(file.choose(), row.names = 1)
Houston <- read.csv(file.choose(), row.names = 1)
SanFrancisco <- read.csv(file.choose(), row.names = 1)

#convert it from dataframe into matrix
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#put them all into a list
Weather <- list(Chicago = Chicago, NewYork=NewYork, Houston=Houston, SanFranciso=SanFrancisco)
Weather

#using apply()
Chicago
apply(Chicago, 1, mean) #what is the mean across the rows
apply(Chicago, 1, max)
apply(Chicago, 1, min)
apply(Chicago, 2, mean) #what is the mean across the columns
apply(Chicago, 2, max)
apply(Chicago, 2, min)
#compare cities side by side:
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#recreating the apply function with loops (advanced topic)
Chicago
#WAY 1: find the mean of every row via loops:
output <- NULL #preparing empty vector
for (i in 1:15){
  output[i] <- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)
#WAY 2: find the mean via the apply function: <= this is so much faster
apply(Chicago, 1, mean)

#using lapply()
lapply()
#if we want to transpose it
t(Chicago)
myNewList <- lapply(Weather, t) #we've transpose the entire list named Weather and all cities at once
#the above is same as 
list(t(Weather$Chicago), t(Weather$NewYork), t(Weather$Houston), t(Weather$SanFranciso))
#another example
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)
#another example <<<< THIS IS OUR DELIVERABLE
rowMeans(Chicago) #identifcal to apply(Chicago, 1, mean)
lapply(Weather, rowMeans)

#combining lapply() with []
Weather$Chicago[1, 1]
lapply(Weather, "[", 1, 1)
Weather
lapply(Weather, "[", 1, )
lapply(Weather, "[", , 3) #march only


#adding your own function with the apply() family functions
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1, ])
lapply(Weather, function(z) z[1, ] -z[2,]) #the difference
lapply(Weather, function(z) round((z[1, ] -z[2,])/z[2,],2))


#sapply()
#AvgHigh_F for July:
sapply(Weather, "[", 1, 7 ) #
#AvgHigh_F for 4th quarter:
sapply(Weather, "[", 1, 10:12)
sapply(Weather, rowMeans)
sapply(Weather, function(z) round((z[1, ] -z[2,])/z[2,],2))


#Nesting Apply Functions
lapply(Weather, rowMeans)
#how do we get the maximums
apply(Chicago, 1, max)
#apply across whole list of the Weather
lapply(Weather, apply, 1, max)
sapply(Weather, apply, 1, max) #<<< deliv. 3
lapply(Weather, apply, 1, min)
sapply(Weather, apply, 1, min) #<<< deliv. 4

#Very advanced tutorial!
#which.max (When was the highest max, get with the names of the months)
names(which.max(Chicago[1,])) #"Jul"
#what if we have to go through all of the cities
apply(Chicago, 1, function(x) names(which.max(x)))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))) )



