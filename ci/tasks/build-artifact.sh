#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
version=`cat version/number`
ls -laF
ls -laf version
cd music-repo
echo $version
gradle assemble -PVersion=$version
pwd
ls -laF build/libs/*.war
mv build/libs/*.war ../build-artifact
ls -laF ../build-artifact
