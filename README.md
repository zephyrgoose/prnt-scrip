# prnt-scrip
This script autodownloads random images from https://prnt.sc/

This script has commandline feedback.

prnt.sc is a web service that works in tandem with a local client to make your screenshots available via a link. The links it creates don't seem to be incrementing, but a valid link is guessable.
This script uses urandom to generate random valid links, then downloads the uploaded screenshot accordingly.
As it is not always accurate, it also scans for and deletes imgur's "This image you are requesting does not exist" placeholder image from the directory it ran in.
