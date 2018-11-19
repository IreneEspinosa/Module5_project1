## @knitr setup

# define knitr options
knitr::opts_chunk$set(echo = FALSE)
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message =  FALSE)

# set any missing NAs in tables to blank
options (knitr.kable.NA = '')

# install and/or load R packages
libraries <- c("fivethirtyeight", "tidyverse", "knitr" ,"kableExtra", "formattable" , "ggthemes", "stringr")
check.libraries <- is.element(libraries, installed.packages()[, 1])==FALSE
libraries.to.install <- libraries[check.libraries]
if (length(libraries.to.install!=0)) {
  install.packages(libraries.to.install)
}
success <- sapply(libraries,require, quietly = FALSE,  character.only = TRUE)
if(length(success) != length(libraries)) {stop("A package failed to return a success in require() function.")}

## @knitr loadData

# load steak_survey dataset
data("weather_check", package="fivethirtyeight")

# create a subset, no missing NAs pick a specific region
sdat <- weather_check %>%
  filter (region==params$region)