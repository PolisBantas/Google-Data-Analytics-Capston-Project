# Google-Data-Analytics-Capston-Project

Case Study 2: How Can a Wellness Technology
Company Play It Smart?

About the Company
Bellabeat is the go-to wellness brand for women with an ecosystem of products and services focused on women’s health. Bellabeat empowers women to reconnect with themselves, unleash their inner strengths and be what they were meant to be.

Founded in 2013 by Urška Sršen and Sando Mur, Bellabeat is a women centered wellness company that utilizes wearable (and fashionalbe) technology to collect data on activity, sleep, stress, and reproductive health. These insights give women the ability to understand their bodies, achieve health goals, and live healthier lives.

## ASK
### Business Task
The purpose of this project is to analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices. These insights will be applied to a Bellabeat product in order to improve their marketing strategy.

### Guiding questions:

1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## PREPARE
The dataset being used for this project is the FitBit Fitness Tracker Data on Kaggle. The dataset is comprised of 18 csv files containing Fitbit data from 33 participants collected over a one month period (04.12.2016-05.12.2016). This includes the participants personal tracker data, such as minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, calories, intensities and heart rate that can be used to explore users’ habits.

This dataset is licensed by CC0: Public Domain and is accessable to everyone. This dataset does have limitations. The sample size is very small and there is no demographic information about the participants. This study was also done in 2016, which means this data is not current as of today. Supplemental data will be needed to make a complete analysis, however for the purpose of this project only one data source will be used.


## PROCESS
I've chosen to use the daily activities, hourly calories, hourly intensities, and daily sleep logs data files because I think they are the most relevant to the uses of Bellabeat products.

### Data formatting and cleaning

In this section I formated the date columns so to be more convinient to analyze. Also the activity - sleep and calories - intensities datasets are related by the Id and ActivityHour columns so I merged them.


## ANALYZE

1. Aggregate your data so it’s useful and accessible.
2. Organize and format your data.
3. Perform calculations.
4. Identify trends and relationships. Deliverable A summary of your analysis

For an average adult, it is recommended to take 10,000 steps per day, according to the CDC. The average amount of steps taken per day is 7,638 steps which is below the recommendation.

Based on this summary, the participants walked an average distance of 5.25 miles across a month period. Mostly engaging in distances that were very active.

Participants spent an average of 432.5 minutes alseep which is 7.2 hours asleep

By weekday, Sundays had the least average steps taken while Saturdays have the most. Tuesdays have the most average calories burned while Thursdays had the least avgerage calories burned.


## SHARE

There is a positive correlation bewetween steps taken and the amount of calories burned per day. Saturdays tend to see the most activity, possibly due to the fact that most people do not work on those days. While Mondays seem to have the least amount of steps taken, possibly because Mondays tend to be one of the busiest days of the work week.

As the intensity of activity increases, the amount of calories burned also steadily increases.

The average calories burned per hour is lowest in the early morning and steadily increases throughout the morning. Activity peaks in the evening, possibly because most people leave work around these times, and rapidly drops off in the night when most people are getting ready for bed.

Participants tended to get the most minutes asleep on Wednesdays while having the least minutes asleep on Mondays. Total time in bed is slightly higher for each day but theres not significant difference between time asleep and time in bed.


## ACT

Based on the analysis, the users of this dataset mainly do sedentary or light activities. They mostly use the distance tracking option over the sleep and weight ones.

Although the sample was to small for safe results, we have some insightfully findings. Bellabeat should focus on women who mainly do light acticities and are interested in stylish gadgets for health trackers. It can improve existing products for a bigger share of market in this category of customers. Also if it seeking in opening new markets, it should introduce products more compatible with women who prefer a more sport tracker than a jewellery one.

The analysis could have been more accurate with more insights if the sample was way bigger and random and targeted only to women.
