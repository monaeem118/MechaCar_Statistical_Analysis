
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)

MechaCar_mpg_data <- read_csv(file="Resources/MechaCar_mpg.csv")

model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_data) #generate multiple linear regression model

summary(model) #generate summary statistics

suspension_coil_data <- read_csv(file="Resources/Suspension_Coil.csv")

suspension_coil_data

total_summary <- suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns
total_summary

lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns
lot_summary

t.test(suspension_coil_data$PSI,mu=1500) #compare sample versus population means

lot <- function(data, lot_num){

filtered_data <- data[deframe(data['Manufacturing_Lot']) == lot_num,]

return (filtered_data)
}

lot1_data <- lot(suspension_coil_data, "Lot1")
lot1_data

t.test((lot1_data$PSI),mu=1500)

lot1 <- subset(suspension_coil_data$PSI, suspension_coil_data$Manufacturing_Lot == "Lot1") #using subset to select specific lot PSI

t.test(lot1, mu=1500)

lot2 <- subset(suspension_coil_data$PSI, suspension_coil_data$Manufacturing_Lot == "Lot2") #using subset to select specific lot PSI

t.test(lot2, mu=1500)

lot3 <- subset(suspension_coil_data$PSI, suspension_coil_data$Manufacturing_Lot == "Lot3") #using subset to select specific lot PSI

t.test(lot3, mu=1500)


