#Data preparation

#Summarize the 2019 FDA data by grouping it by County and Reaction 
#Then count the occurnace 
df <- dat %>%
  group_by(occurcountry, reactionmeddrapt) %>%
  summarise(counts = n()) 


#create a temporary data frame to group the data by Country only and count
#May come in handy for data exploration
df_temp <- df %>%
  group_by(occurcountry) %>%
  summarise(Country_counts = n())
