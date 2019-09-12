library(faraway)
library(MASS)
data("Boston")
View(Boston)
corvif<-function(Boston){
  data<-as.data.frame(Boston)
  tm_cor<-cor(Boston,use = "complete.obs")
  cat("/n/nCorrelation B/w variables/n/n")
  print(tm_cor)
  # Vif
  lmd<-lm(medv~.,data=Boston)
  cat("/n/nVariance inflation Factor/n/n")
  print(vif(lmd)
      )
}
corvif(Boston)


