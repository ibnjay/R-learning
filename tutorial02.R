#LOGICAL
#TRUE T
# FALSE F

4 < 5
10 < 100
10>100
4 == 4
"hi" == "hi"

# ==
# !=
# <
# >
# <=
# >=
# !
# &
# isTRUE(x)

result <- 4< 5
result
typeof(result)

result2 <- !T
result2

result | result2
result & result2

isTRUE(result)
isTRUE(result2)


# while loop for loop

counter <- 1
while(counter < 6){
  print(counter)
counter <- counter+1

}

while(FALSE){
  print("hello")
}


for (i in 1:5){
  print("HELLO R")
  print(i)
}

# 1:5 is a vector


for (i in -1:4){
  print("HELLO R")
  print(i)
}

# if statement

# -- -2 -- -1 --- 0 -- 1--- 2

# nested if statement
rm(answer)
x <-rnorm(1)

if(x > 1) {
  answer <- "Greater than 1"
} else {
    if (x >= -1){
      answer <- "Between -1 and 1"
    }else{
      answer <- "Less than -1"
    }
  
}

# chain if statement
rm(answer)
x <-rnorm(1)

if(x > 1) {
  answer <- "Greater than 1"
}else if (x >= -1){
    answer <- "Between -1 and 1"
}else{
    answer <- "Less than -1"
}

# law of large number exercise expect 68.2
n <- 10000
counter <- 0
for( i in rnorm(n)){
  if( i >= -1 & i  <= 1){
    counter <- counter + 1
  }
}
answer <- counter/n
answer



# Vectors
MyFirstVector <- c(3, 24, 45, 354) #combine
MyFirstVector
typeof(MyFirstVector)
typeof(4:7)
is.numeric(MyFirstVector)
is.integer(MyFirstVector) # False
is.double(MyFirstVector) # True

v2 <- c(3L, 12L, 243L)
is.numeric(v2) & is.integer(v2)

V3 <- c("a", "b34", "HELLO", 7)
is.character(V3)
is.numeric(V3)

#other ways to create vector
seq() # sequence -  similar to  ':'
seq(1,15)
seq(1,15,2) # can give third arg for step.
seq(200,250,11) 
z <- seq(1,15,4)

rep(3,10) # replicate 3 ten times.
d <- rep(3, 50)
rep("a", 5) #vector of character.

x <- c(20,30,40) 
y <- rep(x,10) # replicate another vector 10 times.
y

rnorm(100, 10, sd=10)


# ---Three ways to create Vectors ---------

x <- c(1,123,4234,4) #combine
y <- seq(210,280,10) # sequence
z <- rep("hi", 3)   #replicate

# Accessing elements
y[1]  # get first element.
y[2]  # get second element
y[-1] # whole vector except first element
y[-2] # whole vector except 2nd element

y[1:3] # to get multipe elements
y[3:5]
y[c(1,5,6)] # get first, 5th and 6th element.
y[c(-1,-5,-6)] # get everything besides first, 5th and 6th element.
y[-1:-3]

# vector Operations
a <- 1:15
b <- 16:30
a+b
a > b

#same size.
a <- seq(100,199,10)
b <- rep(5,10)
a/b # vector operations resulting in vecotr.
a+b # vector operations resulting in vecotr.
a-b # vector operations resulting in vecotr.


# recycling of vector


x <- rnorm(5)
# R-specific loop
for(i in x){
  print(i)
}
# conventional programming lang loop
for(j in 1:5){
  print(x[j])
}

# Vectorized approach vs De-vectorized Approach.
# Vectorized approach is faster in R.

?rnorm()
rep(c('a', 'b', 'c'), 3) # "a" "b" "c" "a" "b" "c" "a" "b" "c"
rep(c('a', 'b', 'c'), each=3) #"a" "a" "a" "b" "b" "b" "c" "c" "c"
?seq()
seq(from = 1, to = 10, length.out = 20)
seq(from = 1, to = 10, by=.5)

mynum <- seq(10,100,10)
#can pass vecotr to sqrt function
sqrt(mynum)


remove.packages("ggplot2")
?ggplot()
?diamonds

install.packages("ggplot2")
library(ggplot2)
?diamonds
?qplot()

qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)
