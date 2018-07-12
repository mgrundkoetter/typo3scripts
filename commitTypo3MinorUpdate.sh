#!/bin/bash

# Assumes you have:
# - installed composer as executable binary at a global location (PATH)
# - installed git as executable binary at a global location (PATH)
# - are in a project root path where the composer.json is located
# - are in a cloned version of a Git repository, having configured a remote called "origin"
# - configured a dependency like "typo3/cms": "^8.7" where minor updates can be downloaded

composer update typo3/cms
git add composer.lock
git commit -m "[TASK] Updated package typo3/cms"
git push origin
