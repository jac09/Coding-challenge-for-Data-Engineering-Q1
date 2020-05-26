library(jsonlite)
library(dplyr)

df = read.csv("~/Desktop/raw.txt")

#ANSWER1 number of rows in the raw data
dim(df) 

#ANSWER2 number of rows after removal of the rows with invalid non-numeric profit column data. 
df$Profit..in.millions. = as.numeric(as.character(df$Profit..in.millions.)) #all non-numeric is turned into NA
new_df = df[!is.na(df$Profit..in.millions.), ]
dim(new_df) 

#output as json
json = toJSON(df)
write(exportJSON, "data2.json")

#ANSER3 order by profit and output top 20
df_arranged = df %>% arrange(desc(Profit..in.millions.))
head(df_arranged,20)
