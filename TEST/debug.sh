#!/bin/sh
set -x
cd ..
dmd -debug -g -m64 basil.d
cd TEST
nemiver ../basil --uml --sql --cql --aql --gosql --gocql --crystal test.basil
