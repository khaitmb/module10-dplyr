# Exercise 5: DPLYR Grouped Operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# What was the average department delay in each month?
# Save this as a data frame `dep.delay.by.month`
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.month <- flights %>%
  group_by(month) %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
max.dep.delay <- max(dep.delay.by.month)

max.dep.delay.month <- dep.delay.by.month %>%
  filter(mean == max.dep.delay) %>%
  select(month)

# If your above data frame contains the columns "month", and "delay", you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(dep.delay.by.month$month, dep.delay.by.month$mean)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
arr.delay.by.dest <- flights %>%
  group_by(dest) %>%
  summarize(mean = mean(arr_delay, na.rm = TRUE))

max.arr.delay <- max(arr.delay.by.dest$mean, na.rm = TRUE)

max.arr.delay.dest <- arr.delay.by.dest %>%
  filter(mean == max.arr.delay) %>%
  select(dest)

# You can look up these airports in the `airports` data frame!


### Bonus ###
# Which city was flown to with the highest average speed?
