#!/bin/sh
set -x
dmd -O -m64 basil.d
rm *.o
