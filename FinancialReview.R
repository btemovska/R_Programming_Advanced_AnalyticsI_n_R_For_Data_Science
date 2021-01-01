getwd()
setwd("C:\\Users\\btemo\\OneDrive\\Documents\\Udemy\\R Programming Advanced Analytics In R For Data Sciene\\Section 2 Data Preparation")
getwd()
fin<-read.csv("P3-Future-500-The-Dataset.csv")
head(fin, 10)
tail(fin)
str(fin)

#changing from non-factor to factor:
#ID has integer data type, this needs to be categorical variable
fin$ID <- factor(fin$ID)
fin$Inception <-factor(fin$Inception)

