# drying rate survey
# Andrew MacDonald March 2012


# load packages ---------------------------------------

library(readr)

# read in raw data ------------------------------------

dry.survey <- read.table("data-raw/drying.survey.csv",
                         comment.char = "#",sep = ",",
                         header = TRUE)

export(dry.survey, "data/water_survey.csvy", comment = FALSE)

