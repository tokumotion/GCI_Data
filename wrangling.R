library(tidyr); library(dplyr); library(stringr); library(lubridate)

table(compt_2015$Dataset)
table(compt_2015$Edition)
barplot(table(compt_2015$Edition))
barplot(table(compt_2015$`GLOBAL ID`))

load('~/GitHub/GCI_Data/Data/GCI_Data.RData')

comp_tidy <- gather(compt_2015, Country, Value, 9:ncol(compt_2015))
comp_tidy$Attribute <- str_replace(comp_tidy$Attribute, 'Attribute', 'Region')
REGION <- comp_tidy[which(comp_tidy$Attribute == 'Region'),]

values <- comp_tidy[which(comp_tidy$Attribute == 'Value'),]
values <- values[c(7, 8:10, 3:4)]
save(values, file = '~/GitHub/GCI_Data/Data/values.RData')
