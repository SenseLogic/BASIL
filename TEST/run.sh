#!/bin/sh
set -x
../basil --uml --cql --go --generis --crystal --csharp --rust test.bs test.bd test.bt
