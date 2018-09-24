FROM node:10-stretch

LABEL MAINTAINER="KML Vision <devops@kmlvision.com>"

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends chromium
RUN export CHROME_BIN=chromium
