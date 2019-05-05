#!/bin/sh
set -x
../basil --uml --cql --json --go --generis --crystal --csharp --rust --javascript test.bs test.bd test.bt
