# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# install and load dplyr
install.packages("dplyr")
library("dplyr")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
# Use `as.data.frame()` to make it into a normal data frame
vehicles <- as.data.frame(vehicles)

# Select the different manufacturers (makes) of the cars in this data set.
makes <- select(vehicles, vehicles$make)

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set.
nrow(unique(makes))

# Filter the data set for vehicles manufactured in 1997
vehicles.1997 <- filter(vehicles, year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function similar to how you would use the `max()` function.
# See also: https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
sorted.vehicles.1997 <- arrange(vehicles.1997, hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average gas milage between
# city and highway for each car
vehicles.1997 <- mutate(vehicles.1997, average = (cty+hwy)/2)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
# Save this new data frame in a variable.
vehicles.2WD <- filter(vehicles, drive == '2-Wheel Drive' & cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
# Hint: filter for the worst vecle, then select its ID.
min.hwy <- min(vehicles.2WD$hwy)
min.hwy.vehicle <- filter(vehicles.2WD, hwy == min.hwy)
id <- select(min.hwy.vehicle, id)

# Write a function that takes a `year` and a `make` as parameters,
# and returns the vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
# You'll need to filter more!
MostEfficient <- function(year, make) {
  target_vehicles <- filter(vehicles, year == year & make == make)
  max <- max(target_vehicles$hwy)
  vehicles <- filter(target_vehicles, hwy == max)
  id <- select(vehicles, id)
  return(id)
}

# What was the most efficient honda model of 1995?
MostEfficient(1995, "Honda")