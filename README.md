# node-chromium
Base image for unit/e2e testing node applications.

## ensuring chromium version

Downloading old builds of Chrome / Chromium (see [Project Chromium](https://www.chromium.org/getting-involved/download-chromium))

Let's say you want a build of Chrome 44 for debugging purposes. Google does not offer old builds as they do not have up-to-date security fixes.

However, you can get a build of Chromium 44.x which should mostly match the stable release. Here's how you find it:

Look in https://googlechromereleases.blogspot.com/search/label/Stable%20updates for the last time "44." was mentioned.
Loop up that version history ("44.0.2403.157") in the Position Lookup
In this case it returns a base position of "330231". This is the commit of where the 44 release was branched, back in May 2015. (see footnote)
Open the continuous builds archive
Click through on your platform (Linux/Mac/Win)
Paste "330231" into the filter field at the top and wait for all the results to XHR in.
Eventually I get a perfect hit: https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Mac/330231/ -- Sometimes you may have to decrement the commit number until you find one.
Download and run!
footnote: As this build was made at 44 branch point, it does not have any commits merged in while in beta. Typically that's OK, but if you need a true build of "44.0.2403.x" then you'll need to build Chromium from the 2403 branch. Some PortableApps/PortableChromium sites offer binaries like this, due to security concerns, the Chrome team does not recommend running them.
