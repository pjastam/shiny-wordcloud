Dockerized Shiny App
=======================

This is a Dockerized version of the Shiny App [Wordcloud](http://shiny.rstudio.com/gallery/word-cloud.html) based on the rocker/shiny image.

## Details
I forked the [Example dockerized Shiny App](https://github.com/flaviobarros/shiny-wordcloud) repository and created a 'rocker-version' branch. This 'rocker-version' branch contains a Dockerfile that is based on the rocker/shiny image instead of the r-base image. This part of the Dockerfile is inspired by [Shiny dashboard depicting USA Trade data](https://github.com/mtoto/markets_shiny).

## Installation

If you want to build a Docker image yourself and run it in a container, just fire up your Linux terminal and enter the following commands:

``` r
cd /srv/shinyapps/
git clone -b rocker-version https://github.com/pjastam/shiny-wordcloud.git
cd /srv/shinyapps/shiny-wordcloud
docker build -t pjastam/shiny-wordcloud .
```

Note that a prerequisite to the described workflow is that Docker must already be installed at your server.

## Usage

To run this Shiny App on your computer:

```sh
docker run --rm -p 80:80 pjastam/shiny-wordcloud
```

and it will avaliable at http://127.0.0.1/ or http://localhost

## IMPORTANT

This project is not an alternative Shiny Server. It exposes PORT 80 (not 3838) and is intented to serve only single shiny apps.