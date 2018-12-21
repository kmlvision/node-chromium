# use a convenient lightweight YAML reader
FROM mikefarah/yq:latest AS yaml-reader

FROM node:lts-stretch AS builder
LABEL MAINTAINER="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
# install chromium and export the binary file for testing
RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends chromium gettext && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/
ENV CHROME_BIN=chromium
