#==================================NO 1====================================
#A
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
difference <- before - after
sd(difference)

#B
t.test(after, before, paired = TRUE)

#C (short-answer)

#==================================NO 2====================================
#A (short-answer)

#B
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)

#C (short-answer)
#==================================NO 3====================================
#A (short-answer)

#B
install.packages("BSDA")
library(BSDA)

tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
#C
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = "pink")

#D
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#E (short-answer)
#F (short-answer)
#==================================NO 4====================================
#A
library(ggplot2)

dataa <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"), h = T)
dataa$Group <- as.factor(dataa$Group)
dataa$Group = factor(dataa$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataa$Group)

Group1 <- subset(dataa, Group == "Kucing Oren")
Group2 <- subset(dataa, Group == "Kucing Hitam")
Group3 <- subset(dataa, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

#B
bartlett.test(Length ~ Group, data = dataa)

#C
model1 = lm(Length ~ Group, data = dataa)
anova(model1)

#D (short-answer)

#E
TukeyHSD(aov(model1))
#F
install.packages("ggplot2")
library("ggplot2")

ggplot(dataa, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "pink") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

#==================================NO 5====================================
#A
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("data_soal_5.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#B
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#C
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#D
tukey <- TukeyHSD(anova)
print(tukey)

#E
tukey.cld <- multcompLetters4(anova, tukey)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)