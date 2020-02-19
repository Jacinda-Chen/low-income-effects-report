# Script to read in and plot health care facility data from
# the city of San Francisco
# Jacinda Chen
# jrchen@dons.usfca.edu
# February 10, 2020

# load packages dplyr, ggplot2, readr to read, wrangle, and plot data
library(dplyr)
library(ggplot2)
library(readr)

# read in the health care facility dataset
health_care <- read_csv(file = "data/raw_data/Health_Care_Facilities.csv")

# Count how many of each type of facility there is in San Francisco
health_care %>%
  group_by(`Facility Type`) %>%
  ggplot(aes(x = `Facility Type`)) +
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  geom_bar()

# Look at the different services that community clinics provide
health_care %>%
  ggplot(aes(x = `Facility Type`,
             fill = Services)) +
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  geom_bar() +
  ggtitle("Types of Services per Facility Type")

 ggsave("output/Types_of_Services_per_Facility_Type.pdf")