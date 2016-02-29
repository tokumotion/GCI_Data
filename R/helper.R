# helper.R

library(dplyr); library(tidyr); library(stringr); library(magrittr)

# Load required data for analysis from local
load('../Data/entities.RData')
load('../Data/values.RData')
load('../Data/comp_tidy.RData')

fplot <- values %>% 
  filter(grepl("^\\d+\\w+\\s", values$`Series unindented`),
         grepl("2015-2016", values$Edition)) %>% 
  right_join(., entities, by = 'Country')

regionplot <- values %>% 
  filter(grepl("^\\d+\\w+\\s", values$`Series unindented`),
         grepl("2015-2016", values$Edition)) 

names(fplot) = c('Series', 'Attribute', 'Country_ID', 'Value', 'Edition', 'ID', 
                 'Country', 'Type', 'WB', 'IMF')
fplot$Value <- as.numeric(fplot$Value)

radarplot <- spread(fplot[,c(1,3,4)], Country_ID, Value)

fplot %<>% 
  group_by(IMF, Series) %>% 
  summarise(Values = mean(Value, na.rm = TRUE)) %>% 
  filter(IMF != is.na(IMF)) %>% 
  select(Series, IMF, Values) %>% 
  spread(IMF, Values)

cplot <- regionplot %>% 
  right_join(., entities, by = "Country")