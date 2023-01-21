mydata <- 1:20

# ---------creating Matrices---------

A <- matrix(mydata, 4, 5)

B <- matrix(seq(2,40,2), 4, 5, byrow=T)

C <- matrix(rep(2,20), 4, 5)
B[2,3]
# operations on matrix
B/C
B > C

# using rbind()

r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1,2,3)

my.r.bind.matrix <- rbind(r1,r2,r3)
my.r.bind.matrix[1,1]
my.r.bind.matrix["r1",1]
# using cbind()
c1 <- seq(1,5)
c2 <- seq(-1,-5)
c3 <- seq(-10,-50,-10)

my.c.bind.matrix = cbind(c1,c2,c3)
another.c.bind = cbind(r1,r2,r3)

#named dimension 
my.c.bind.matrix[3,"c3"]

#named vectors exists too.
charlie <- seq(10, 50, 10)
charlie
names(charlie) # null right now.
 # assignment to the function.
names(charlie) <- c("a", "b", "c", "d", "e")
names(charlie)
charlie["d"]
# clear names 
names(charlie) <- NULL

rownames(my.c.bind.matrix) <- c("a", "b", "c", "d", "e")

colnames(my.c.bind.matrix)
colnames(my.c.bind.matrix) <- c("mycol1", "mycol2", "mycol3")

rupa <- rep(c(1,2,3), each=4)
matrix(rupa, 3, 4, byrow=T)

# -----------read csv Dataframes------
# Method 1 setlect file Manually
stats <- read.csv(file.choose())
stats
rm(stats)
getwd()
setwd("/Users/jayt/Documents/R-course")
stats <- read.csv("P2-Demographic-Data.csv")
# read them as factor 
stats <- read.csv("P2-Demographic-Data.csv", stringsAsFactors=T)

stats

head(stats)
tail(stats, n=10)

nrow(stats) # 195 rows.
ncol(stats) # 5 col

str(stats)
summary(stats)

# --------Using the $ sign.---------
head(stats)
stats[3,3]

stats[3, "Birth.rate"]

colnames(stats)
rownames(stats)

# $ sign doesn't work for matrices
stats$Internet.users # identical to stats[,"Internet.users"]
stats[,"Internet.users"]

stats$Internet.users[2] # getting second element of that coloum.
stats$Internet.users[1:5]

levels(stats$Income.Group) #user of $ sign.

#---------Basic Operations with DataFrame------

# subsetting
stats[1:10,]
stats[4:7,]
stats[c(4,50,80),]

is.data.frame(stats[1,]) # no need for drop=F
is.data.frame(stats[,1]) # No
is.data.frame(stats[,1,drop=F]) # yes.

# multily colums
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# add colums
head(stats)
stats$myCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

stats$xyz <- c(1:195)
head(stats, n=10)

stats$xy <- 1:5

# remove a col
stats$xy <- NULL
stats$myCalc <- NULL

#-------------Filtering Data Frames --
head(stats)
stats$Internet.users < 2 # gives a vector.
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users <2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
stats[stats$Country.Name == "Malta",]

#------Introduction to qplot()
#install.packages("ggplot2")
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(.5), color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot", color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="path", color=I("blue"))

#-----visualizing what we need.
qplot(data=stats, x = Internet.users, y = Birth.rate,
      size=I(2), color=I("red"))
qplot(data=stats, x = Internet.users, y = Birth.rate,
      size=I(2), color=Income.Group)


#-------- Creating dataframe ------------

#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates",
                            "Argentina","Armenia","Antigua and Barbuda","Australia",
                            "Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso",
                            "Bangladesh","Bulgaria","Bahrain","Bahamas, The",
                            "Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia",
                            "Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")


mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)

head(mydf)
summary(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)
rm(mydf)

# same approach works with cbind and r bind.
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)

a <- seq(1,5)
b <- c("a", "b", "c", "d", "e")
myMatrix <- cbind(seq=a, val=b)
rbind(row1=a, row2name=b)

data$Country.Name <- as.factor(data$Country.Name)
mydf$Region <- as.factor(mydf$Region)

#-----------------------------------------
#----------------Merging Data Frames ----
head(stats)
head(mydf)
mydf$Country <- NULL

merged <- merge(stats, mydf, by.x = "Country.Code", by.y="Code")
head(merged)
str(merged)
summary(merged)

qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region, size=I(2))

#-----------------------------------------
# ---------Visualizing merged dataframe----

# shape
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color=Region, size=I(3), shape=I(17))

# Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      main="Internet user vs Birthrate", color=Region, size=I(3), shape=I(17))

#transparency -- alpha()

qplot(data=merged, x=Internet.users, y=Birth.rate,
      main="Internet user vs Birthrate", color=Region, size=I(2),
      shape=I(19), alpha=I(.7))

#---------------------------------------------------------
#---------------------------------------------------------
#------------- section 5 ggplot --------------------------
getwd()
setwd("/Users/jayt/Documents/R-course")

movies <- read.csv("Movie-Ratings.csv")
head(movies)
colnames(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating",
                      "BudgetMillion", "Year")
str(movies)
movies$Year <- factor(movies$Year) # don't want year to be numerical. categorical
movies$Genre <- factor(movies$Genre)
str(movies)
summary(movies)

# tecting factor with vector.
test_vector <- c("a", "a", "b", "b", "d", "g", "a", "a")
factor(test_vector)
summary(test_vector)
summary(factor(test_vector))


#-------------Aesthetics-----
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# add geometry
 ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
 geom_point()

 # add color
 ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                         color=Genre)) +
   geom_point()
 
 #add size
 # add color -- not Genre but Budget
 ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                         color=Genre, size=BudgetMillion)) +
   geom_point()


# plotting with layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                              color=Genre))
p

p + geom_point()
p + geom_col()
p + geom_area()
p + geom_line()
# multipe layers
p + geom_line() + geom_point()

psize <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                                 color=Genre, size=BudgetMillion))
psize + geom_point()
psize + geom_area()
psize + geom_line()

#-----overriding aesthetics -------

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                              color=Genre, size=BudgetMillion))

q + geom_point()

# example 1
q + geom_point(aes(size=CriticRating))

# example 2
q + geom_point(aes(color=BudgetMillion)) + xlab("Ramdon")

# example 3
q + geom_point(aes(x=BudgetMillion))

q + geom_point(aes(x=BudgetMillion)) + xlab("Budget")

# example 4
q + geom_line(size=1) + geom_point()


# Mapping vs settings
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point(aes(color=Genre)) # Mapping
r + geom_point(color="DarkGreen") # Setting

r + geom_point(aes(size=CriticRating), color= "red") # mapping size. setting color
r + geom_point(size=2, color="navyblue") # setting both size and color.
r + geom_point(size=2, aes(color=Genre)) # setting size, mapping color.


# -- Histogram and Density chart --
s <- ggplot(data=movies, aes(x=BudgetMillion))
s + geom_histogram() # picked a binwidth by default.
s + geom_histogram(binwidth=20, fill="black") #setting
s + geom_histogram(binwidth=20, aes(fill=Genre), color='gray') #fill is color. color is border.

s + geom_density()
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")
?geom_density

#mydata <- round(rnorm(1000,100,10), 2)
#ggplot(data=mydata) + geom_density()


#----- starting layer tip ---

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="lightgreen", color="darkgreen")

#another way
t <- ggplot(data=movies)
t + geom_histogram(aes(x=AudienceRating), binwidth =5,
                   fill="lightblue", color="darkblue") 

t + geom_histogram(aes(x=BudgetMillion), binwidth =10,
                   fill="lightblue", color="darkblue") 

t + geom_histogram(aes(x=BudgetMillion, fill=Year), binwidth=10,
                  color="darkblue") 

# ----- statistical transformation ---------

u <- ggplot(data=movies, aes(x=AudienceRating, y=CriticRating, color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#blox plot
u <- ggplot(data=movies, aes(x=Genre, y=CriticRating, color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)

u2 <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
u2 + geom_boxplot() 
u2 + geom_boxplot() + geom_point()
u2 + geom_boxplot() + geom_jitter(size=.2) # use jitter.
u + geom_jitter(size=.4) + geom_boxplot(alpha=.5) 

#-----------Using Facets ---------
v <- ggplot(data=movies, aes(x=BudgetMillion))
v + geom_histogram(binwidth=10, aes(fill=Genre), color="black")

# facets
v + geom_histogram(binwidth=10, aes(fill=Genre), color="black") +
  facet_grid(Genre~. , scales="free")

v + geom_histogram(binwidth=10, aes(fill=Genre), color="black") +
  facet_grid(.~Genre , scales="free")

# scatter plot

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
w + geom_point(size=.5) 

# facets
w + geom_point(size=.5) +
  facet_grid(Genre~.)

w + geom_point(size=.5) +
  facet_grid(.~Year)
# 2 facets.
w + geom_point(size=.5) +
  facet_grid(Genre~Year)

# added smoother.
w + geom_point(size=.5) + 
  geom_smooth() +
  facet_grid(Genre~Year)

# added smoother.
w + geom_point(aes(size=BudgetMillion)) + 
  geom_smooth() +
  facet_grid(Genre~Year)

#------coordinates ----
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
m + geom_point()

# limit
m + geom_point() + xlim(50,100) + ylim(50,100)

# wont work well always? Cuts data in historgram instead of just zoom
n <- ggplot(data=movies, aes(x=BudgetMillion))
n + geom_histogram(aes(fill=Genre), color="black") +
  ylim(0,50)

# zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
  coord_cartesian(ylim=c(0,50))

n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
  coord_cartesian(xlim=c(0,50))

n + geom_histogram(binwidth = 10, aes(fill=Genre), color="black") +
   coord_fixed(xlim=c(0,100))

w + geom_point(size=.5) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(20,95))


# themes
h <- ggplot(data=movies, aes(x=BudgetMillion)) + 
   geom_histogram(binwidth = 10, aes(fill=Genre), color="black") 
# axis label
h + xlab("Money Spent") + ylab("Number of Movies") 

# theme
h + xlab("Money Spent") + ylab("Number of Movies") + 
  theme(axis.title.x=element_text(size=15, color="red"),
        axis.title.y=element_text(color="Blue", size=15),
        axis.text.x=element_text(size=10),
        axis.text.y=element_text(size=10))
# legent formating
h + xlab("Money Spent") + ylab("Number of Movies") + 
  theme(legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.box.background = element_rect(color="black", fill="gray"),
        legend.position = c(1,1),
        legend.justification = c(1,1)
        )
# add title
h + xlab("Money Spent") + ylab("Number of Movies") + ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(size=15, color="red"),
        axis.title.y=element_text(color="Blue", size=15),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(size=20, color="DarkBlue", family="Courier")
  )


ggplot(data=movies, aes(x=BudgetMillion)) + 
  geom_histogram(binwidth = 10, color="black",  position="identity") +
  facet_grid(.~Genre)

ggplot(data=movies, aes(x=BudgetMillion, color=Genre)) +
  geom_histogram(binwidth = 10,   position="identity")










