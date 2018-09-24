FROM node:10-stretch

LABEL MAINTAINER="KML VISION, devops@kmlvision.com"

# install chromium and export the binary file for testing
RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends chromium
RUN export CHROME_BIN=chromium
