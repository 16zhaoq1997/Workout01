#title： make-shot-chart-script.R
#description：this is for creating a charts of scatterplot of shots made of individuals in the place of the shot
#inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv, shots-data.csv
#output: andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf, klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, gsw-shots-data.pdf, gsw-shots-data.JPG
setwd("/Users/jasonzhao/Desktop/Stats 133/HW/Workout01/code")
library(ggplot2)
library(jpeg)
library(grid)
library(readr)

#create Raste Object
court_file <- "../images/nba-court.jpg"
courtimage<-rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)


#create five charts
dat = read_csv("../data/shots-data.csv")
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
iguodala_shot_chart

green_shot_chart <- ggplot(data = green) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
green_shot_chart

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
durant_shot_chart

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
thompson_shot_chart

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
curry_shot_chart

gsw_shot_chart <- ggplot(data = dat) +
  annotation_custom(courtimage, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  theme_minimal() + facet_wrap(.~name, nrow = 2, ncol = 3)
gsw_shot_chart

 