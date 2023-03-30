#!/usr/bin/env bash
set -e
# Download the latest version of the script

URL='https://api.papermc.io/v2/projects/paper'
FILE='paper.jar'

# Get the latest version
VERSION=$(curl -X 'GET' $URL -H 'accept: application/json' | jq -r '.versions[-1]')
echo "Latest version: $VERSION"

# Get the latest build
BUILD=$(curl -X 'GET' $URL/versions/$VERSION -H 'accept: application/json' | jq -r '.builds[-1]')
echo "Latest build: $BUILD"

# Download the jar
curl -X 'GET' $URL/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar -o $FILE