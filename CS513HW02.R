#Name: Zhenhang Ji
#CWID: 10445682
remove(list = ls())
#Procedures:
#1.Load csv file
bcw<-read.csv("/Users/pro/Desktop/CS513/breast-cancer-wisconsin.data.csv", na.strings = "?")
str(bcw)
View(bcw)
#2.summerize & indentify
summary(bcw)
is.na(bcw)
bcw[bcw == "?"] <- NA
View(bcw)
#3.replacing
str(bcw)
bcw$F6 <- as.integer(as.character(bcw$F6))
result_mean <- mean((bcw$F6), trim = 0, na.rm = TRUE)
bcw[is.na(bcw)] <- result_mean
for(i in 1:ncol(bcw)){
  bcw[is.na(bcw[,i]), i] <- mean(bcw[,i], na.rm = TRUE)
}
View(bcw)
str(bcw)
#4.displaying the frequency table of Class vs. F6
frequency_table <- table(bcw$Class,bcw$F6)
View(frequency_table)
#5.Displaying the scatter plot of F1 to F6, one pair at a time
plot(bcw$F1, bcw$F2, main = "Scatter Plot of F1,F2")
plot(bcw$F3, bcw$F4, main = "Scatter Plot of F3,F4")
plot(bcw$F5, bcw$F6, main = "Scatter Plot of F5,F6")
#6.Show histogram box plot for columns F7 to F9
hist(bcw$F7, col = "red", freq = F, border = "white")
hist(bcw$F8, col = "green", freq = F, border = "white")
hist(bcw$F9, col = "blue", freq = F, border = "white")
boxplot(bcw$F7, bcw$F8, bcw$F9)

#Delete all the objects from your R- environment. Reload the “breast-cancer-wisconsin.data.csv” from canvas into R. Remove any row with a missing value in any of the columns.
remove(list = ls())
bcw<-read.csv("/Users/pro/Desktop/CS513/breast-cancer-wisconsin.data.csv", na.strings = "?")
bcw<-na.omit(bcw)





