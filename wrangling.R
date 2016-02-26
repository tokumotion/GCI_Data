library(tidyr); library(dplyr); library(stringr); library(lubridate)

table(compt_2015$Dataset)
table(compt_2015$Edition)
barplot(table(compt_2015$Edition))
barplot(table(compt_2015$`GLOBAL ID`))

comp_tidy <- gather(compt_2015, Country, Value, 9:ncol(compt_2015))
comp_tidy$Attribute <- str_replace(comp_tidy$Attribute, 'Country', 'Region')
REGION <- comp_tidy[which(comp_tidy$Attribute == 'Region'),]
