FROM node:lts-stretch

LABEL MAINTAINER="KML VISION, devops@kmlvision.com"

# install chromium and export the binary file for testing
RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends chromium gettext && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/
ENV CHROME_BIN=chromium
