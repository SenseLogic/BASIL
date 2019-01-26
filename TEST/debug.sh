#!/bin/sh
set -x
cd ..
dmd -debug -g -m64 basil.d
cd TEST
nemiver ../basil --uml --cql --go --rust --crystal test.basil
