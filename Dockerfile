FROM rocker/shiny
			
MAINTAINER Piet Stam "pjastam@gmail.com"

# install R package dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
	libxml2 \
	libxml2-dev \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
    
## Install packages from CRAN
RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
	rmarkdown \
	tm \
	wordcloud \
	memoise \
    ##&& Rscript -e "devtools::install_github(c('MarkEdmondson1234/googleID')" \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY /myapp /srv/shiny-server/

EXPOSE 80

COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]
