#Name: 
#CWID: 
rm(list = ls())
#procedures:
library(class) 
library(e1071)
#Load csv file
bcw<-read.csv("/Users/pro/Desktop/CS513/breast-cancer-wisconsin.data.csv", na.strings = "?")
bcw[bcw == "?"] <- NA
View(bcw)
str(bcw)
class(bcw)
#delete the rows with missing value
bcw<-na.omit(bcw)
View(bcw)
#change data to factor type
bcw$Class <- factor(bcw$Class, levels = c("2","4"),labels = c("Benign", "Malignant"))
is.factor(bcw$Class)
#Use the Naïve Bayes methodology to develop a classification model for the Diagnosis.
?naiveBayes()
## Naive Bayes classification using only one variable 
index <- sort(sample(nrow(bcw),as.integer(.70*nrow(bcw))))
training <- bcw[index,]
test <- bcw[-index,]

nBayes_class <- naiveBayes(as.factor(Class) ~., data = training)
category_class <- predict(nBayes_class, test)
## Compare the prediction to actual
table(Class = bcw$Class, Class = bcw$Class)
table(NBayes = category_class, Class = test$Class)
?prop.table
prop.table(table(Class = bcw$Class, Class = bcw$Class))
?formula
nBayes_wrong <- sum(category_class != test$Class)
nBayes_wrong
nBayes_errorrate <- nBayes_wrong/length(category_class)
nBayes_errorrate


