# A first exploration of installed packages ------------------------------------


# In which libraries does R search for packages? -------------------------------
# your personal computing environment may return one or more locations
# .libPaths(), .Library


# Create a tibble of all installed packages ------------------------------------
# use installed.packages() to get all installed packages
# if you like working with data frame or tibble, make it so right away!
# remember to use View(), dplyr::glimpse(), or similar to inspect


# How many packages are installed? ---------------------------------------------


# Explore the packages - count some things. ------------------------------------
# For example, tabulate by LibPath, Priority, or both.
# What proportion need compilation?
# What version of R they were built on?

# For tidyverse users, here are some useful patterns
# data |> count(var)
# data |> count(var1, var2)
# data |> count(var) %>% mutate(prop = n / sum(n))


# Reflect on the above and make a few notes to yourself ------------------------
# What did you learn about your R package installation?
# What are you curious to know more about?


# If you have time to do more. -------------------------------------------------

# Is every installed package either base or recommended?
# Explore package naming conventions (all lower case, contains '.', etc)
# Use `fields` argument to installed.packages() to get more info.
#   -- What proportion of packages have a URL that point to github?
