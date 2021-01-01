getwd()
setwd("C:\\Users\\btemo\\OneDrive\\Documents\\Udemy\\R Programming Advanced Analytics In R For Data Sciene\\Section 2 Data Preparation")
getwd()
fin<-read.csv("P3-Future-500-The-Dataset.csv")
head(fin, 10)
str(fin)

#note Factors are char but they have levels
#note char are just characters without levels

#----------------Part 1 - changing from non-factor to factor:
#ID has integer data type, this needs to be categorical variable
fin$ID <- factor(fin$ID)
fin$Inception <-factor(fin$Inception)

#changing from factor to non-factor:
#Factor Variable Trap(FVT)

#1st fixing EXPENSES column
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
                      # " Dollars", pattern we are looking for
                      # "" emtpy quotes is what we are replacing with
                      # where are we searching for that pattern and replacing it
fin$Expenses <- gsub(",", "", fin$Expenses) #now commas are gone
  #note it moved Expenses column from factor into a character now that the Dollars and commas are gone
#2nd fixing PROFIT column 
fin$Revenue <-gsub("\\$", "", fin$Revenue)# $ signs are now gone
fin$Revenue <- gsub(",", "", fin$Revenue) # commas are gone
#3rd fixing Growth column
fin$Growth <- gsub("%", "", fin$Growth) #% signs are gone

#Converting them from char into numeric
fin$Expenses <- as.numeric(fin$Expenses) #now it is a double
fin$Revenue <- as.numeric(fin$Revenue) #now it is double
fin$Growth <- as.numeric(fin$Growth) #now it is double

#----------------Part 2 - missing data:
#1 locating missing data
head(fin, 24)
complete.cases(fin)# it is checking if there are any NAs with the associate row
                    #note it is not picking up empty cells
#make sure to re-load the data, and convert the  missing cells to show NA for them
fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings = c(""))
head(fin,20)
#make sure to re-run the code above with converting the datatypes
fin[!complete.cases(fin),] #now it is pulling all NA's

#2. how to filter our dataframe
#2A filtering: using which() for non-missing data
which(fin$Revenue == 9746272,) #which row has revenue equal 97462
      #answer is row #3
      #which only looks for TRUE values, skips FALSE and it skips NA
fin[which(fin$Revenue == 9746272), ]
# ID     Name Industry Inception Employees State       City Revenue Expenses  Profit Growth
#3  3 Greenfax   Retail      2012        NA    SC Greenville 9746272  1044375 8701897     16

#2B filtering: using is.na() for missing data
is.na(fin$Expenses)
fin[is.na(fin$Expenses),]
#     ID      Name     Industry Inception Employees State     City  Revenue Expenses   Profit Growth
# 8   8 Rednimdox Construction      2013        73    NY Woodside       NA       NA       NA     NA
# 17 17   Ganzlax  IT Services      2011        75    NJ   Iselin 14001180       NA 11901180     18
# 44 44 Ganzgreen Construction      2010       224    TN Franklin       NA       NA       NA      9

#2C removing records with missing data
fin_backup <- fin #creating another dataset containing all edits we've done so far

fin[!complete.cases(fin),] #pulls all records were we have NA regardless of which column is coming from
fin[is.na(fin$Industry),] #gives you the rows were we do have NA in Industry
fin <- fin[!is.na(fin$Industry), ] #gives you the rows wehe we don't have NAs in Industry and it creates overwrites the dataframe
fin

#now that we've eliminated two rows from our dataset, it still shows that we have 500 records, but really we have 498
#that is because each company is assigned to ID
#----------------Part 3 - Reseting the dataframe index:
rownames(fin) <- 1:nrow(fin)
tail(fin)
#     ID             Name           Industry Inception Employees State        City  Revenue Expenses   Profit Growth
# 493 495  Rawfishcomplete Financial Services      2012       124    CA Los Angeles 10624949  2951178  7673771     22
# 494 496 Buretteadmirable        IT Services      2009        93    ME    Portland 15407450  2833136 12574314     25
# 495 497 Inventtremendous       Construction      2009        24    MN    Woodbury  9144857  4755995  4388862     11
# 496 498   Overviewparrot             Retail      2011      7125    TX  Fort Worth 11134728  5152110  5982618     12
# 497 499       Belaguerra        IT Services      2010       140    MI        Troy 17387130  1387784 15999346     23
# 498 500      Allpossible        IT Services      2011        24    CA Los Angeles 11949706   689161 11260545     24

#----------------Part 4 - Replacing Missing Data
#4A - Replacing Missing Data: Factual Analysis Method




