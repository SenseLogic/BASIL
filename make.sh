#!/bin/sh
set -x
dmd -m64 basil.d
rm *.o
