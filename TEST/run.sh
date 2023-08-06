#!/bin/sh
set -x
../basil --mysql --phoenix --ignore-drop test.bs test.bd
../basil --uml --cassandra --json --go --generis --crystal --csharp --rust --javascript --force-drop test.bs test.bd test.bt
