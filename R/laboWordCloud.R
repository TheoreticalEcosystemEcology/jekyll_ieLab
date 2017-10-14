################################################
## Integrative Ecology Lab wordCloud
##
## first version: October, 14 2017
## last modification: October, 14 2017
## Willian Vieira
##
## R version 3.4.0 (2017-04-21)
## Platform: x86_64-apple-darwin15.6.0
## Running under: OS X 10.12.5 (Sierra)
################################################

library(bibtex)
library(tm)
library(wordcloud2)
library(extrafont)
library(grDevices)
library(htmlwidgets)
library(webshot)

# data
  refs <- read.bib(file = "_bibliography/labo.bib")

# keywords
  keyw <- lapply(refs, function(x) tolower(as.character(x[1]$keywords))) # select keywords and transfor low case

  keyList <- as.list("NA")
  for(i in 1: length(refs)) {
    keyList[[i]] <- strsplit(keyw[[i]], split = ",") # split keywords
  }

  keyw <- unlist(keyList)
  keyw <- stringr::str_replace_all(keyw, "[^a-zA-Z0-9\\s]", "") #remove everything is not a number or letter

# title
  title <- tolower(as.character(refs$title))
  title <- unlist(strsplit(title, split = " "))
  title <- stringr::str_replace_all(title, "[^a-zA-Z0-9\\s]", "") #remove everything is not a number or letter
  # stop words
  stopWords <- stopwords(kind = "en")
  title <- title[! title %in% stopWords]

# abstract
  abst <- tolower(as.character(refs$abstract))
  abst <- unlist(strsplit(abst, split = " "))
  abst <- stringr::str_replace_all(abst, "[^a-zA-Z0-9\\s]", "") #remove everything is not a number or letter
  # stop words
  abst <- abst[! abst %in% stopWords]

# merging title and keywords
  titleKeyw <- table(c(title, keyw))
  titleKeyw <- titleKeyw[which(titleKeyw > 3)]

  # color
col1 <- c(rgb(159, 33, 31, maxColorValue = 255), # style 1
          rgb(226, 133, 72, maxColorValue = 255),
          rgb(79, 92, 70, maxColorValue = 255))

col2 <- c(rgb(159, 33, 31, maxColorValue = 255), # style 2
          rgb(79, 92, 70, maxColorValue = 255),
          rgb(231, 187, 42, maxColorValue = 255))

col3 <- c(rgb(231, 187, 42, maxColorValue = 255), # style 3
          rgb(79, 92, 70, maxColorValue = 255),
          rgb(159, 33, 31, maxColorValue = 255))

colFunc <- colorRampPalette(col3)

hoverFunction = htmlwidgets::JS("function hover() {}")

my_graph <-
wordcloud2(rev(sort(titleKeyw)),
                       fontFamily = "Fira Sans",
                       color = colFunc(nrow(titleKeyw)),
                       size = 0.55,
                       gridSize = 1,
                       backgroundColor = rgb(255, 255, 255, maxColorValue = 255),
                       rotateRatio = 0,
                       ellipticity = 0.3,
                       hoverFunction = hoverFunction
)

# export
  # html
saveWidget(my_graph, "keyword_cloud.html",libdir='assets/cloud_deps', selfcontained = F)
system('mv keyword_cloud.html _includes/keyword_cloud.html')

