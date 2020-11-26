# use a convenient lightweight YAML reader
FROM mikefarah/yq:latest AS yaml-reader

FROM node:lts-stretch AS builder
LABEL MAINTAINER="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
# simple bash script to get latest chromium binary (see https://github.com/scheib/chromium-latest-linux)
COPY update.sh /update.sh

# install chromium OS level dependencies
RUN apt-get update -qq && \
    apt-get install -qq -y \
	libasound2 \
	libatk1.0-0 \
	libatk-bridge2.0-0 \
	libgtk-3-0 \
	libatomic1 \
	libatspi2.0-0 \
	libavcodec57 \
	libavutil55 \
	libc6 \
	libcairo2 \
	libcups2 \
	libdbus-1-3 \
	libdrm2 \
	libevent-2.0-5 \
	libexpat1 \
	libflac8 \
	libfontconfig1 \
	libfreetype6 \
	libgcc1 \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk2.0-0 \
	libicu57 \
	libjpeg62-turbo \
	libminizip1 \
	libnspr4 \
	libnss3 \
	libopenjp2-7 \
	libopus0 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libpangoft2-1.0-0 \
	libpci3 \
	libpng16-16 \
	libpulse0 \
	libre2-3 \
	libsnappy1v5 \
	libstdc++6 \
	libvpx4 \
	libwebp6 \
	libwebpdemux2 \
	libwebpmux2 \
	libx11-6 \
	libx11-xcb1 \
	libxcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxml2 \
	libxrandr2 \
	libxrender1 \
	libxslt1.1 \
	libxss1 \
	libxtst6 \
	x11-utils \
	xdg-utils \
	zlib1g && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/

# install latest chromium version
# binary will be available under /usr/bin/chromium
RUN chmod +x /update.sh && \
    cd / && \
    ./update.sh && \
    ln -s "/latest/chrome" /usr/bin/chromium && \
    chromium --version
