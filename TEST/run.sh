#!/bin/sh
set -x
../basil --uml --cql --go --generis --crystal --csharp --rust test.bsl test.bsd test.bst
