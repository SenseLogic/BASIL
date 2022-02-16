#!/bin/sh
set -x
dmd -O -inline -m64 basil.d
rm *.o
