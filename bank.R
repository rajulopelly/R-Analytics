library(readr)
bank <- read.csv("C:/Users/Unitech/Desktop/bank.csv")
View(bank)
names(bank)
is.na(bank)
sum(is.na(bank))
class(bank$age)
class(bank$job)
levels(bank$job)
A <-factor(bank$job,levels = c("admin.","blue-collar","entrepreneur","housemaid",
"management","retired","self-employed","services","student","technician","unemployed","unknown") , labels = c(0,1,2,3,4,5,6,7,8,9,10,11))
levels(A)
b <- as.numeric(A)
bank$job <- b
class(bank$marital)
M <- factor(bank$marital , levels = c("divorced","married","single") , labels = c(1,2,3))
levels(M)
m <-as.numeric(M)
bank$marital<-m
E <- factor(bank$education, levels = c("primary","secondary","tertiary","unknown"), labels = c(1,2,3,4))
e <- as.numeric(E)
bank$education <- e
class(bank$default)
levels(bank$default)
D <- factor(bank$default , levels = c("yes","no"), labels = c(1,2))
d <- as.numeric(D)
bank$default <- d
class(bank$balance)
class(bank$housing)
levels(bank$housing)
H <- factor(bank$housing , levels = c("yes","no"), labels = c(1,2))
h <- as.numeric(H)
bank$housing <-  h
class(bank$loan)
levels(bank$loan)
L <- factor(bank$loan , levels = c("yes","no"), labels = c(1,2))
l <- as.numeric(L)
bank$loan <- l
class(bank$contact)
levels(bank$contact)
C <- factor(bank$contact , levels = c("cellular","telephone","unknown"), labels = c(1,2,3))
c <- as.numeric(C)
bank$contact <- c
class(bank$day)
levels(bank$day)
class(bank$month)
levels(bank$month)
M <- factor(bank$month , levels = c("apr","aug","dec","feb","jan","jul","jun","mar","may","nov","oct","sep"), labels = c(1,2,3,4,5,6,7,8,9,10,11,12))
m <- as.numeric(M)
bank$month <- m
class(bank$duration)
class(bank$campaign)
levels(bank$campaign)
class(bank$pdays)
class(bank$previous)
class(bank$poutcome)
levels(bank$poutcome)
PO <- factor(bank$poutcome , levels = c("failure","other","sucess","unknown"), labels = c(1,2,3,4))
po <- as.numeric(PO)
bank$poutcome <- po
class(bank$y)
levels(bank$y)
X <- factor(bank$y , levels = c("yes","no"), labels = c(1,0))
bank$y <- X
## logistic regresions
library(ResourceSelection)
library(fmsb)
library(ROCR)
library(rpart)
library(stats)
set.seed(100)
a=sample(nrow(bank),31647)
train=bank[a,]
test=bank[-a,]
mylogi <-glm(y~., data=train,family = "binomial")
mylogi
summary(mylogi)
 
guru <- step(mylogi,data=train,direction="backward")
summary(guru)
 guru1 <- step(mylogi,data=train,direction="forward")
summary(guru1)

anova(guru,test = "Chisq")
ggg<-predict(mylogi,data=test,type = "response")
cm<-table(mylogi,ggg)



