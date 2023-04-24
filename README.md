# node-chromium

Base image for unit/e2e testing node applications (based on latest node:lts-stretch)

This downloads and installs the chromium OS level dependencies (
see https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix) and
the latest chromium version on each docker image build using the update script
from https://github.com/scheib/chromium-latest-linux.
For convenience we also provide a simple yaml reader cli (see https://github.com/mikefarah/yq).

Current preinstalled Chrome Version: 114.0.5732.0
Current preinstalled Node version: v18.16.0
Current preinstalled NPM version: 9.5.1

The docker images will be tagged with the Chrome Version as they are built.

NB: We will not maintain regular builds for this image, as we're switching to puppeteer to manage the chrome binary for
our node application testing (see https://github.com/puppeteer/puppeteer).

# docker tagging policy

For future releases we follow the following docker tag policy:

* shorthand tag containing only the node major version: `release-node[node-major-version]`
* full tag containing chrome, node and debian
  version: `release-[chrome-version]_node[node-major-version]_debian[debian-version]`

We do not maintain the default `latest` tag anymore since we want to encourage our developers to explicitly state the
node version they want to use.
