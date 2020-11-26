# node-chromium
Base image for unit/e2e testing node applications (based on latest node:lts-stretch)

This downloads and installs the chromium OS level dependencies (see https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix) and the latest chromium version on each docker image build using the update script from https://github.com/scheib/chromium-latest-linux.
For convenience we also provide a simple yaml reader cli (see https://github.com/mikefarah/yq).

Current Chrome Version installed: 89.0.4338.0 

The docker images will be tagged with the Chrome Version as they are built. 

NB: We will not maintain regular builds for this image, as we're switching to puppeteer to manage the chrome binary for our node application testing (see https://github.com/puppeteer/puppeteer).
