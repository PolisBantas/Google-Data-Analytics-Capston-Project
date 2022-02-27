## PREPARE

# uploading the necessary packages


library(tidyverse)
library(dplyr)
library(ggplot2)
library(lubridate)
library(janitor)
library(skimr)
library(viridis)


# Importing the datasets

activity <- read.csv("C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\Fitabase Data 4.12.16-5.12.16\\dailyActivity_merged.csv")
sleep <- read.csv("C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\Fitabase Data 4.12.16-5.12.16\\sleepDay_merged.csv")
calories <- read.csv("C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\Fitabase Data 4.12.16-5.12.16\\hourlyCalories_merged.csv")
intensities <- read.csv("C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\Fitabase Data 4.12.16-5.12.16\\hourlyIntensities_merged.csv")


# Previewing the datasets

glimpse(activity)
glimpse(sleep)
glimpse(calories)
glimpse(intensities)


## PROCESS

# Formating the date columns in the data sets

activity$ActivityDate <- as.Date(activity$ActivityDate, format = "%m/%d/%Y")
sleep$SleepDay <- as.Date(sleep$SleepDay, format = "%m/%d/%Y")
intensities$ActivityHour <-mdy_hms(intensities$ActivityHour)
calories$ActivityHour <-mdy_hms(calories$ActivityHour)


# Checking how much data we have

n_distinct(activity$Id)
n_distinct(sleep$Id)
n_distinct(calories$Id)
n_distinct(intensities$Id)


# Summarizing the datasets

activity %>%
  select(TotalSteps, Calories, SedentaryMinutes) %>% 
  summary()

activity %>% 
  select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes) %>% 
  summary()

calories %>% 
  select(Calories) %>% 
  summary()

intensities %>% 
  select(TotalIntensity) %>% 
  summary()

sleep %>% 
  select(TotalSleepRecords, TotalTimeInBed, TotalMinutesAsleep) %>% 
  summary()


# Saving the dataframes for visualization with Tableau

write.csv(activity,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\activity.csv", row.names = FALSE)
write.csv(sleep,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\sleep.csv", row.names = FALSE)
write.csv(intensities,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\intensities.csv", row.names = FALSE)
write.csv(calories,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\calories.csv", row.names = FALSE)


# Merging dataframes

names(sleep)[2] <- "ActivityDate"

activity_sleep <- merge(activity,sleep, by = c("Id", "ActivityDate"))

calories_intensities <- merge(calories, intensities, by = c("Id", "ActivityHour"))

calories_intensities$time <- format(calories_intensities$ActivityHour, format = "%H:%M:%S")

calories_intensities$date <- format(calories_intensities$ActivityHour, format = "%m/%d/%y")

  

# Saving the 2 new dataframes for visualization with Tableau

write.csv(calories_intensities,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\calories_intensities.csv", row.names = FALSE)
write.csv(activity_sleep,"C:\\Users\\User\\Documents\\Google Data Analytics\\Course 8\\case study\\activity_sleep.csv", row.names = FALSE)


## ANALYZING

# Analyzing the average steps, distance and calories per day of the week

Sys.setlocale("LC_TIME", "English")


activity_sleep %>%  
  group_by(wday(ActivityDate,  label = TRUE)) %>% 
  summarize(mean(TotalSteps), mean(TotalDistance), mean(VeryActiveDistance),
            mean(ModeratelyActiveDistance), mean(LightActiveDistance), mean(Calories)) %>% 
  top_n(3)


# Analyzing the average time in bed and asleep


activity_sleep %>% 
  group_by(wday(ActivityDate, label = TRUE)) %>% 
  summarize(mean(TotalTimeInBed), mean(TotalMinutesAsleep)) %>% 
  top_n(3)

# Analyzing the average calories burnt per hour of the day

calories_intensities %>% 
  group_by(time) %>% 
  summarize(mean(Calories)) %>% 
  top_n(8)

# Analyzing the average intensities per hour of the day

calories_intensities %>% 
  group_by(time) %>% 
  summarize(mean(TotalIntensity)) %>% 
  top_n(8)


## SHARING

# Plotting average calories per day

activity_sleep %>% 
  group_by(wday(ActivityDate, label = TRUE)) %>% 
  ggplot(aes(x= wday(ActivityDate, label = TRUE), y = mean(Calories))) +
  geom_histogram(stat = "identity", fill = "yellow") +
  labs(title = "Average Calories burnt per day", x= "Day of the week", y = "Calories")

# Plotting average Steps per day

activity_sleep %>% 
  group_by(wday(ActivityDate, label = TRUE)) %>% 
  ggplot(aes(x= wday(ActivityDate, label = TRUE), y = mean(TotalSteps))) + 
  geom_histogram(stat = "identity", fill = "green") +
  labs(title = "Average Steps per day", x= "Day of the week", y = "Steps")

# Plotting average Distance per day

activity_sleep %>% 
  group_by(wday(ActivityDate, label = TRUE)) %>% 
  ggplot(aes(x= wday(ActivityDate, label = TRUE), y = mean(TotalDistance))) + 
  geom_histogram(stat = "identity", fill = "Blue") +
  labs(title = "Average Distance per day", x= "Day of the week", y = "Distance")
 
# Plotting the relation between intensities and calories


calories_intensities %>% 
  ggplot() +
  geom_point(mapping = aes(x= TotalIntensity, y= Calories)) +
  geom_smooth(aes(x= TotalIntensity, y= Calories),method = lm) + 
  labs(title = "Calories vs. Intensities", x= "Intensities")
           
# Plotting the relation between very active distances and calories

activity_sleep %>% 
  ggplot() +
  geom_point(mapping = aes(x= VeryActiveDistance, y = Calories)) + 
  geom_smooth(aes(x= VeryActiveDistance, y= Calories), method = lm) + 
  labs(title = "Very active Distance vs. Calories", x = "Very Active Distance")


# Plotting the Calories and Intensities by hour


ggplot(calories_intensities, aes(x= time, y= Calories)) + 
  geom_histogram(stat = "identity", fill = "blue") + 
  theme(axis.text.x = element_text(angle = 90)) + 
  labs(title = "Calories burnt per hour", x = "Time")


ggplot(calories_intensities, aes(x= time, y= TotalIntensity)) + 
  geom_histogram(stat = "identity", fill = "purple") + 
  theme(axis.text.x = element_text(angle = 90)) + 
  labs(title = "Intensity per hour", x = "Time", y= "Intensity")
           