#Name: Zhenhang Ji
#CWID: 10445682
rm(list = ls())
#Procedures:
installed.packages()
#install.packages("kknn")
library(kknn)
#Load csv file
bcw<-read.csv("/Users/pro/Desktop/CS513/breast-cancer-wisconsin.data.csv", na.strings = "?")
bcw[bcw == "?"] <- NA
View(bcw)
str(bcw)
#delete the rows with missing value
bcw<-na.omit(bcw)
View(bcw)
#change data to factor type
?levels
bcw$Class <- factor(bcw$Class, levels = c("2","4"),labels = c("Benign", "Malignant"))
is.factor(bcw$Class)
str(bcw)
#Use the knn methodology (k=3,5 and 10) to develop a classification models for the Diagnosis.
?kknn()
index <- sort(sample(nrow(bcw),as.integer(.70*nrow(bcw))))
training <- bcw[index,]
test <- bcw[-index,]
predict_k3 <- kknn(formula=as.factor(Class)~., training, test, k=3, kernel = "rectangular" )
fit_3 <- fitted(predict_k3)
table(test$Class,fit_3)

predict_k5 <- kknn(formula=as.factor(Class)~., training, test, k=5, kernel = "rectangular" )
fit_5 <- fitted(predict_k5)
table(test$Class,fit_5)

predict_k10 <- kknn(formula=as.factor(Class)~., training, test, k=10, kernel = "rectangular" )
fit_10 <- fitted(predict_k10)
table(test$Class,fit_10)
#error rate
knn_error_rate_k3 = sum(fit_3 != test$Class)/length(test$Class)
knn_error_rate_k3

knn_error_rate_k5 = sum(fit_5 != test$Class)/length(test$Class)
knn_error_rate_k5

knn_error_rate_k10 = sum(fit_10 != test$Class)/length(test$Class)
knn_error_rate_k10


