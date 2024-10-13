# node-chromium

Base image for unit/e2e testing node applications (based on latest node:lts-stretch)

This downloads and installs the chromium OS level dependencies (
see https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix) and
the latest chromium version on each docker image build using the update script
from https://github.com/scheib/chromium-latest-linux.
For convenience we also provide a simple yaml reader cli (see https://github.com/mikefarah/yq).

* Current preinstalled Chromium Version: 131.0.6775.0
* Current preinstalled Node version: v20.18.0
* Current preinstalled NPM version: 10.8.2

The docker images will be tagged with the Chrome Version as they are built.

NB: We will not maintain regular builds for this image, as we're switching to puppeteer to manage the chrome binary for
our node application testing (see https://github.com/puppeteer/puppeteer).

# docker tagging policy

For future releases we follow the following docker tag policy:

* shorthand tag containing only the node major version: `node[node-major-version]`
* full tag containing chromium, node and debian
  version: `chromium[chromium-version]_node[node-major-version]_debian[debian-major-version]`

We still maintain the default `latest` tag, but we want to encourage our developers to explicitly state the
node version they want to use.
