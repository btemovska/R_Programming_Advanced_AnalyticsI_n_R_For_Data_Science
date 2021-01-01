#changing from factor to non-factor:
#Factor Variable Trap(FVT)

#example before we get back to financial analysis:
a <- c("12", "13", "14", "12","12" )
a #"12" "13" "14" "12" "12"
typeof(a) #"character"

b <- as.numeric(a)
b #12 13 14 12 12
typeof(b) #"double"

#Converting from Factor into Numerics
z <- factor(c("12", "13", "14", "12","12"))
z #12 13 14 12 12 Levels: 12 13 14
typeof(z) #"integer"

y <- as.numeric(z)
y # 1 2 3 1 1
typeof(y) #"double"

#how to avoid this, how are we converting z into numeric
x <-as.character(z) #"12" "13" "14" "12" "12" note it is without levels
x <- as.numeric(x)
x #12 13 14 12 12
typeof(x) #"double"
