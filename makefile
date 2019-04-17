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
	cd _site && cp home/index.html index.html
	cd _site && lftp ftp://view2301.ielab.02778@ielab.recherche.usherbrooke.ca -e "mirror -e -R ; quit"

$(WDH): $(WD) $(BIB)
	Rscript $(WD)

server:
	bundle exec jekyll server --destination _server

clean:
	rm -rf _server _site
