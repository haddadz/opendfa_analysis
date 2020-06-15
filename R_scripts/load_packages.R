#Packages

#Load the necessary R packages

library("devtools")
#If using opendfa for first time then setup thru devtools 
# devtools::install_github("ropenhealth/openfda")

#openfda pkg
library("openfda")
#data.table pkg may come in handy for data table format/manipulation
require(data.table)

#Tidy verse pkgs needed for data and plotting
require(dplyr)
library(tidyr)
library(ggplot2)

#KableExtra pkg comes in handy for tabulation in RMarkdown
library(kableExtra)

#Required for Easy Color Brewing
library("RColorBrewer")