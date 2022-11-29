#!/bin/sh
set -x
dmd -debug -g -gf -gs -m64 basil.d
rm *.o
