# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# install and load dplyr
install.packages("dplyr")
library("dplyr")

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the vehicles data.frame
vehicles <- as.data.frame(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
target_vehicles <- filter(vehicles, make == "Acura" & year == 2015)
max.hwy <- max(target_vehicles$hwy)
vehicle <- filter(target_vehicles, hwy == max.hwy)
model <- select(vehicle, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.hwy.model <- select(
  filter (
    filter (
      vehicles, make == "Acura" & year == 2015
    ),
    hwy == max.hwy
  ),
  model
)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.model <- filter(vehicles, make == "Acura" & year == 2015) %>%
  filter(hwy == max.hwy) %>%
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times

# Without chaining


# Nested functions


# Pipe operator


# Pretty similar...
