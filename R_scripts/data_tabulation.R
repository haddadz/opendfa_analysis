#Tabulate Data

#Good idea to explore and tabulate the data prior to plotting and performing rest of the anlaysis
#Provides a window of how big the data is and what should be done next

#create the data of interest in the specified format
#Will use for tabulation in Kable function and heatmap
dat.heatmap <- table(df$reactionmeddrapt, df$occurcountry)


#To display the table in Markdown, we will use kable function
#Good start..but should look for alternatives
#It is clear tabulation is not the answer here.
kable(dat.heatmap, format = "html", row.names = TRUE) %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "condensed") ) %>%
    scroll_box(width = "500px", height = "500px")

