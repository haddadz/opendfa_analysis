#Plot the data

#Bar plot of the temporaty data frame of Country
#Good idea to explore and visualize the data prior to plotting the rest of the data
ggplot(df_temp) +
  geom_bar( aes(x = as.factor(occurcountry), y = Country_counts), stat = "identity") +
  theme(legend.position = "none") 

#Stacked Bar plot of the data frame grouped by Country and adverse reaction
#Not a great plot. Should look for an alternative
#Too many colors/distracting. 
ggplot(df, aes(x = occurcountry, y = counts)) +
  geom_bar(aes(color = as.factor(reactionmeddrapt), fill = as.factor(reactionmeddrapt)), stat = "identity") +
  theme(legend.position = "none")


#Create the color Palette for the heatmap
col <- colorRampPalette(brewer.pal(10, "RdYlBu"))(256)
#Plot a heatmap of the data (which we tabulated earlier)
#Easy way to visualize a large data set of this size which has many "features" or adverse effects
heatmap(dat.heatmap, scale = "none", col =  col, Rowv = NULL, Colv = NULL,  keep.dendro = F)