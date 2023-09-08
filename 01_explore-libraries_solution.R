# A first exploration of installed packages ------------------------------------
library(fs)
library(tidyverse)


# In which libraries does R search for packages? -------------------------------
# your personal computing environment may return one or more locations
.libPaths()


# What is your default library? ------------------------------------------------
.Library



# Confirm the library supplied is, in fact, the default library. ---------------
identical(.Library, .libPaths())
# if you have more than one result returned by .libPaths(), check one of them
# identical(.Library, .libPaths()[2])

# Huh? Maybe this is an symbolic link issue?
identical(path_real(.Library), path_real(.libPaths()))
# if more than one path
# identical(path_real(.Library), path_real(.libPaths()[2]))



# Create a tibble of all installed packages ------------------------------------
df_pkgs <- installed.packages() |>
  as_tibble()


# How many packages are installed? ---------------------------------------------
nrow(df_pkgs)



# Explore the packages - count some things. ------------------------------------
# For example, tabulate by LibPath, Priority, or both.
df_pkgs |>
  count(LibPath, Priority)

# What proportion need compilation?
df_pkgs |>
  count(NeedsCompilation) |>
  mutate(prop = n / sum(n))


# What version of R they were built on?
df_pkgs |>
  count(Built) |>
  mutate(prop = n / sum(n))



# Reflect on the above and make a few notes to yourself ------------------------
# What did you learn about your R package installation?
# What are you curious to know more about?


# If you have time to do more. -------------------------------------------------

# Is every installed package either base or recommended?
df_pkgs |>
  count(Priority %in% c("base", "recommended"))


# Explore package naming conventions (all lower case, contains '.', etc)
df_pkgs |>
  count(str_detect(Package, "\\."))

# Use `fields` argument to installed.packages() to get more info.
# ?installed.packages
df_pkgs_url <- installed.packages(fields = "URL") |>
  as_tibble()

# What proportion of packages have a URL that point to github?
df_pkgs_url |>
  mutate(github = str_detect(URL, "github")) |>
  count(github) |>
  mutate(prop = n / sum(n))
