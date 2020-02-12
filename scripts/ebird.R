# Script to read in and plot ebird data from
# the city of San Francisco
# Jacinda Chen
# jrchen@dons.usfca.edu
# February 10, 2020

# load packages dplyr, ggplot2, readr to read, wrangle, and plot data
library(dplyr)
library(ggplot2)
library(rebird)

# Find species in this area
ebird_data <- ebirdgeo(lat = 38, lng = -122, includeProvisional = TRUE,
         hotspot = TRUE)

# Find the top recent 10 birds in San Francisco
ebird_data %>%
  arrange(desc(howMany)) %>%
  head(10) %>%
  ggplot(aes(x = comName, y = howMany)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_bar(stat = "identity") +
  ggtitle("Top 10 Birds in San Francisco in February 2020") +
  xlab("Common Name") +
  ylab("How Many")