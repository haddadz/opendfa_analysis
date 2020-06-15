#Data Setup

#Load the 2019 open fda data using the openfda package 

#Load a full year's worth of data; will choose 2019.
#Split by quarter since we have 100 report limit

#2019 Q1 data
dat1 <- openfda::fda_fetch("https://api.fda.gov/drug/event.json?search=receivedate:[20190101+TO+20190331]&limit=100")
#2019 Q2 data
dat2 <- openfda::fda_fetch("https://api.fda.gov/drug/event.json?search=receivedate:[20190401+TO+20190630]&limit=100")
#2019 Q3 data
dat3 <- openfda::fda_fetch("https://api.fda.gov/drug/event.json?&search=receivedate:[20190701+TO+20190930]&limit=100")
#2019 Q4 data
dat4 <- openfda::fda_fetch("https://api.fda.gov/drug/event.json?&search=receivedate:[20191001+TO+20191231]&limit=100")



###################
#dataManipulation
###################

#We have many nested lists. Hard to work with data.
#Since we only have 4 data frames, will just copy/paste. No need to create a function.
#Otherwise create a function to make it easy and repeatable. 

#First will unlist the necessary/featurss of interest (adverse reactions)
#Second will combine using ID column 
#Repeat one more time to merge with original data frame since it is a nested list within a list

#Q1 data

# unlist nested list with id
dat1_reactions <- rbindlist(dat1$results$patient$reaction, fill = T, idcol = "id")

# create same id in remaining data frame
dat1$results$patient$id <- seq.int(nrow(dat1$results$patient))

#Merge
dat1_pt_merged <- merge(dat1$results$patient, dat1_reactions, by = "id")
dat1_pt_merged <- dat1_pt_merged %>%
        select("id", "patientonsetage", "summary",  "patientonsetageunit", 
               "patientweight", "patientsex", "patientagegroup", "reactionmeddraversionpt", 
               "reactionmeddrapt", "reactionoutcome")

dat1$results$id <- seq.int(nrow(dat1$results))
#Merge Again
dat1_merged <- merge(dat1$results, dat1_pt_merged, by = "id")


#Q2 data

# unlist nested list with id
dat2_reactions <- rbindlist(dat2$results$patient$reaction, fill = T, idcol = "id")

# create same id in remaining data frame
dat2$results$patient$id <- seq.int(nrow(dat2$results$patient))

#Merge
dat2_pt_merged <- merge(dat2$results$patient, dat2_reactions, by = "id")
dat2_pt_merged <- dat2_pt_merged %>%
        select("id", "patientonsetage", "summary",  "patientonsetageunit", 
               "patientweight", "patientsex", "patientagegroup", "reactionmeddraversionpt", 
               "reactionmeddrapt", "reactionoutcome")

dat2$results$id <- seq.int(nrow(dat2$results))
#Merge Again
dat2_merged <- merge(dat2$results, dat2_pt_merged, by = "id")



#Q3 data

# unlist nested list with id
dat3_reactions <- rbindlist(dat3$results$patient$reaction, fill = T, idcol = "id")

# create same id in remaining data frame
dat3$results$patient$id <- seq.int(nrow(dat3$results$patient))

#Merge
dat3_pt_merged <- merge(dat3$results$patient, dat3_reactions, by = "id")
dat3_pt_merged <- dat3_pt_merged %>%
        select("id", "patientonsetage", "summary",  "patientonsetageunit", 
               "patientweight", "patientsex", "patientagegroup", "reactionmeddraversionpt", 
               "reactionmeddrapt", "reactionoutcome")


dat3$results$id <- seq.int(nrow(dat3$results))
#Merge Again
dat3_merged <- merge(dat3$results, dat3_pt_merged, by = "id")



#Q4 data

# unlist nested list with id
dat4_reactions <- rbindlist(dat4$results$patient$reaction, fill = T, idcol = "id")

# create same id in remaining data frame
dat4$results$patient$id <- seq.int(nrow(dat4$results$patient))

#Merge 
dat4_pt_merged <- merge(dat4$results$patient, dat4_reactions, by = "id")
dat4_pt_merged <- dat4_pt_merged %>%
        select("id", "patientonsetage", "summary",  "patientonsetageunit", 
               "patientweight", "patientsex", "patientagegroup", "reactionmeddraversionpt", 
               "reactionmeddrapt", "reactionoutcome")


dat4$results$id <- seq.int(nrow(dat4$results))
#Merge Again
dat4_merged <- merge(dat4$results, dat4_pt_merged, by = "id")


###########Merge the data from Q1-Q4 in one data frame and only select the col of interest
columns_interest <- c("occurcountry", "reactionmeddrapt")
dat <- rbind(dat1_merged[,columns_interest], dat2_merged[,columns_interest], dat3_merged[,columns_interest], dat4_merged[,columns_interest])

