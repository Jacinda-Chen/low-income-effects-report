# Script to read in and plot street tree data from
# the city of San Francisco
# Jacinda Chen
# jrchen@dons.usfca.edu
# February 10, 2020

# load packages dplyr, ggplot2, readr to read, wrangle, and plot data
library(dplyr)
library(ggplot2)
library(readr)
library(plotrix)

# read in the health care facility dataset
health_care <- read_csv(file = "data/Health_Care_Facilities.csv")

# Count how many of each type of facility there is in San Francisco
health_care %>%
  group_by(`Facility Type`) %>%
  ggplot(aes(x = `Facility Type`)) +
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  geom_bar()

# Look at the different services that community clinics provide
health_care %>%
  filter(`Facility Type` == "Community Clinic") %>%
  group_by(Services) %>%
  count() %>%
  pie3D(slices, labels = Services, explode = 0.1,
        main = "Pie Chart of Community Clinic Services")