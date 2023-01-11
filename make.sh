#!/bin/sh
set -x
dub build --force --build=plain
rm -r .dub
