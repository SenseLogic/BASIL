#!/bin/sh
set -x
../basil --sql --phoenix --ignore-drop test.bs test.bd
../basil --uml --cql --json --go --generis --crystal --csharp --rust --javascript --force-drop test.bs test.bd test.bt
