#title: make-shots-data
#description: The primary purpose of these command is to create a csv data file shots-data-summary.csv that will contain the required variables to be used in the shots analysis and table.
#inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
#outputs:andre-iguodala-summary.txt, draymond-green-summary.txt, kevin-durant-summary.txt, klay-thompson-summary.txt,stephen-curry-summary.txt, shots-data.csv, shots-data-summary.txt 

library(dplyr)

setwd("/Users/jasonzhao/Desktop/Stats 133/HW/Workout01/code")
iguodala<-read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green<-read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant<-read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson<-read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry<-read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)


iguodala = mutate(iguodala, name = "Andre Iguodala")
green = mutate(green, name = "Draymond Green")
durant = mutate(durant, name = "Kevin Durant")
thompson = mutate(thompson, name = "Klay Thompson")
curry = mutate(curry, name = "Stephen Curry")

iguodala$shot_made_flag[iguodala$shot_made_flag[] == "n"] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag[] == "y"] = "shot_yes"
green$shot_made_flag[green$shot_made_flag[] == "n"] = "shot_no"
green$shot_made_flag[green$shot_made_flag[] == "y"] = "shot_yes"
durant$shot_made_flag[durant$shot_made_flag[] == "n"] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag[] == "y"] = "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag[] == "n"] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag[] == "y"] = "shot_yes"
curry$shot_made_flag[curry$shot_made_flag[] == "n"] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag[] == "y"] = "shot_yes"

iguodala = mutate(iguodala, minute = (iguodala$period*12 - iguodala$minutes_remaining))
green = mutate(green, minute = (green$period*12 - green$minutes_remaining))
durant = mutate(durant, minute = (durant$period*12 - durant$minutes_remaining))
thompson = mutate(thompson, minute = (thompson$period*12 - thompson$minutes_remaining))
curry = mutate(curry, minute = (curry$period*12 - curry$minutes_remaining))

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("../output/draymond-green-summary.txt")
summary(green)
sink()

sink("../output/Kevin-Durant-summary.txt")
summary(durant)
sink()

sink("../output/Klay-Thompson-summary.txt")
summary(thompson)
sink()

sink("../output/Stephen-Curry-summary.txt")
summary(curry)
sink()

dat<-rbind(iguodala, green, durant, thompson, curry)
write.csv(dat, file = "../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
summary(dat)
sink()
