################################################
## Integrative Ecology Lab wordCloud
##
## first version: October, 14 2017
## last modification: September, 12 2018
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
library(magrittr)

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
  keyw <- unlist(strsplit(keyw, ' ')) # split compound words
  keyw <- keyw[which(keyw != "")] # remove empty space

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

# merging titles and keywords
tk <- c(title)

# Add people's keywords
ppl <- c("beauté", "raclette")
tk <- c(tk, rep(ppl, 3))

# fix frequent compound words and remove usless words
tk <- tk[-grep('species', tk)]
tk <- tk[-grep('using', tk)]
tk <- tk[-grep('relationship', tk)]
tk <- tk[-grep('ffect', tk)]
tk <- tk[-grep('link', tk)]
tk <- tk[-grep('drive', tk)]
tk <- tk[-grep('assess', tk)]
tk <- tk[-grep('toward', tk)]
tk <- tk[-grep('outbreak', tk)]
tk <- tk[-grep('identi', tk)]
tk <- tk[-grep('structu', tk)]
tk <- tk[tk != 'and' & tk != 'et' & tk != 'st' & tk != 'making' & tk != 'des' & tk != 'can' & tk != 'major' & tk != 'different' & tk != 'along' & tk != 'represent' & tk != 'shade' & tk != 'reveal' & tk != 'across' & tk != 'years']

tk[grep('model', tk)] <- 'models'
tk[unique(c(grep('food', tk), grep('web', tk)))] <- 'food web'
tk[grep('interaction', tk)] <- 'interaction'
tk[grep('dynamic', tk)] <- 'dynamic'
tk[grep('diversity', tk)] <- 'diversity'
tk[c(grep('climate', tk), grep('change', tk))] <- 'climate change'
tk[grep('metaecos', tk)] <- 'meta-ecosystem'
tk[grep('metacom', tk)] <- 'meta-community'
tk[grep('probabil', tk)] <- 'probability'
tk[grep('networ', tk)] <- 'network'
tk[grep('theor', tk)] <- 'theory'
tk[grep('distribution', tk)] <- 'distribution'
tk[grep('ecolog', tk)] <- 'ecology'
tk[grep('communities', tk)] <- 'community'
tk[grep('function', tk)] <- 'functional'
tk[grep('trait', tk)] <- 'trait'
tk[grep('tree', tk)] <- 'tree'
tk[grep('integrat', tk)] <- 'integrating'
tk[grep('scal', tk)] <- 'scale'
tk[grep('shade', tk)] <- 'shade'
tk[grep('experiment', tk)] <- 'experiment'
tk[grep('gradient', tk)] <- 'gradient'
tk[grep('forest', tk)] <- 'forest'
tk[grep('biogeogr', tk)] <- 'biogeography'
tk[grep('simula', tk)] <- 'simulation'
tk[grep('landscap', tk)] <- 'landscape'
tk[grep('hypothes', tk)] <- 'hypothesis'
tk[grep('extincti', tk)] <- 'extinction'
tk[grep('environment', tk)] <- 'environment'
tk[grep('data', tk)] <- 'data'
tk[grep('complexi', tk)] <- 'complexity'

# merging title and keywords into table
  titleKeyw <- table(tk)
  titleKeyw <- titleKeyw[which(titleKeyw > 2)]

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
                       color = colFunc(nrow(titleKeyw)),
                       size = 0.55,
                       backgroundColor = rgb(255, 255, 255, maxColorValue = 255),
                       rotateRatio = 0,
                       ellipticity = 0.4,
                       hoverFunction = hoverFunction
)

# export
  # html
saveWidget(my_graph, "keyword_cloud.html",libdir='assets/cloud_deps', selfcontained = F)
