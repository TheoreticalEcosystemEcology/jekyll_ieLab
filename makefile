BIB=_bibliography/labo.bib
WD=R/laboWordCloud.R
WDH=keyword_cloud.html
DATA=_data/*
INC=_includes/*
LAY=_layouts/*
SITE=_site
ASSPDF=assets/pdf/*
ASSimg=assets/img/*
PAGES=$(wildcard *.md)

$(SITE): $(WDH) $(DATA) $(INC) $(LAY) $(PAGES) $(ASS) $(ASSPDF) $(ASSimg)
	bundle exec jekyll build

$(WDH): $(WD) $(BIB)
	Rscript $(WD)

server:
	bundle exec jekyll server --destination _server

dockerServer:
	docker run -p 4000:4000 -v $(shell pwd):/site bretfisher/jekyll-serve

clean:
	rm -rf _server _site
