# Data Exploration
library(readr)
outbreak <- read.csv("C:/Users/Unitech3/Downloads/outbreak.csv")
View(outbreak)
str(outbreak)
names(outbreak)
nrow(outbreak)
ncol(outbreak)
head(outbreak)
is.na(outbreak)
table(is.na(outbreak))
sum(is.na(outbreak))
# Consider the variable "age"
is.numeric(outbreak$age)
class(outbreak$age)
outbreak$age
# consider the variable sex
is.numeric(outbreak$sex)
class(outbreak$sex)
range(outbreak$sex)
table(outbreak$sex)
# consider the variable "ill"
is.numeric(outbreak$ill)
class(outbreak$ill)
is.integer(outbreak$timesupper)
class(outbreak$timesupper)
range(outbreak$timesupper)

# Data Manupulation
na.omit(outbreak)
outbreak1=na.omit(outbreak)
outbreak1
# Consider the variable "age"
mean(outbreak1$age)
outbreak1$age<- as.numeric(outbreak$age)
outbreak1$age
class(outbreak1$age)
mean(outbreak1$age)
range(outbreak1$age)
summary(outbreak1$age)
# consider the variable sex
Sex <- factor(outbreak$sex, levels = c("Female", "Male"), labels = c(0,1))
Sex
is.factor(Sex)
table(outbreak$sex)
table(Sex)
outbreak$sex <- Sex
# consider the variable "ill"
ill <- factor(outbreak$ill, levels = c("TRUE", "FALSE"), labels = c(1, 2))
ill
class(ill)
is.factor(ill)
summary(ill)
# consider the variable timesupper
library(lubridate)
supper_date <- "19400418"
supper_dt <- paste(supper_date, outbreak1$timesupper)
supper_dt
head(supper_dt)
class(supper_dt)
supper_datetime <- ymd_hm(supper_dt)
supper_datetime
head(supper_datetime)
class(supper_datetime)
outbreak1$supperdatetime <- supper_datetime
# consider variables onsettime and onsetdate
library(stringr)
onsettime_new <-str_pad(outbreak1$onsettime, 4, pad = "0")
onsettime_new
head(onsettime_new)
table(outbreak1$onsetdate)
onsetdate_new <- str_replace(outbreak1$onsetdate, '18-Apr', '19400418')
onsetdate_new <- str_replace(onsetdate_new, '19-Apr', '19400419')
head(onsetdate_new)
onsetdt <- paste(onsetdate_new, onsettime_new, sep = "")
onsetdt
head(onsetdt)
range(onsetdt)
library(lubridate)
onset_datetime <- ymd_hm(onsetdt)
onset_datetime
class(onset_datetime)
outbreak1$onsetdatetime <- onset_datetime










