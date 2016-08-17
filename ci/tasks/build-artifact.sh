#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
cd music-repo
echo $version
gradle assemble -PVersion=$version
pwd
ls -laF build/libs/*.war
cp build/libs/*.war build-artifact
ls -laF build-artifact
