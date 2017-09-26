#!/bin/bash 
# A one-liner script to clone an organization's PUBLIC GitHub repositories.

GHBU_ORG=${GHBU_ORG-"Wyvernsquare"}                                   # the GitHub organization whose repos will be backed up
curl -s https://api.github.com/orgs/${GHBU_ORG}/repos\?per_page\=200 | grep clone_url | awk -F '"' '{print $4}' | xargs -n 1 -P 4 git clone
