# use a convenient lightweight YAML reader
FROM mikefarah/yq:latest AS yaml-reader

FROM node:20-bookworm AS builder
LABEL MAINTAINER="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
# simple bash script to get latest chromium binary (see https://github.com/scheib/chromium-latest-linux)
COPY update.sh /update.sh

# install chromium OS level dependencies
RUN apt-get update -qq && \
    apt-get install -qq -y chromium && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/

# install latest chromium version
# binary will be available under /usr/bin/chromium
RUN chmod +x /update.sh && \
    cd / && \
    ./update.sh && \
    ln -sf "/latest/chrome" /usr/bin/chromium && \
    chromium --version
