
#load libraries

#shiny
library(shiny)
library(shinyjs)
library(shinycssloaders)
library(shinydashboard)


#data wrangling

library(dplyr)
library(data.table)
library(readxl)
library(stringr)

#database
library(mongolite)

#source files
source("R_Code/sourceDir.R")
sourceDir("R_Code/")
sourceDir("Modules/")



##Temporary database connection

