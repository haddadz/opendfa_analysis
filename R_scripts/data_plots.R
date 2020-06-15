#Plot the data

#Bar plot of the temporaty data frame of Country
#Good idea to explore and visualize the data prior to plotting the rest of the data
ggplot(df_temp) +
  geom_bar( aes(x = as.factor(occurcountry), y = Country_counts), stat = "identity") +
  ggtitle("Bar plot of adverse events reports per Country \n") +
  xlab(" ") + ylab("Count \n")+
  theme_bw(base_size=12)+theme(legend.position = "none")

#Stacked Bar plot of the data frame grouped by Country and adverse reaction
#Not a great plot. Should look for an alternative
#Too many colors/distracting. 
ggplot(df, aes(x = occurcountry, y = counts)) +
  geom_bar(aes(color = as.factor(reactionmeddrapt), fill = as.factor(reactionmeddrapt)), stat = "identity") +
  ggtitle("Stacked Bar plot of different adverse events counts per Country \n") +
  xlab(" ") + ylab("Count \n")+
  theme_bw(base_size=12)+ theme(legend.position = "none")


#Plot a heatmap of the data (which we tabulated earlier)
#Easy way to visualize a large data set of this size which has many "features" or adverse events
heatmap.2(dat.heatmap, scale = "none", col = bluered(100), 
          trace = "none", density.info = "none", Rowv = F, Colv = F)