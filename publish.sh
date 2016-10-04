#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

rm -rf pages
git clone -b gh-pages \
    git@github.com:erikvanoosten/thrift-missing-specification.git pages
mv index.html thrift-rpc-missing-specification.pdf pages

pushd pages
git config user.name "Erik van Oosten"
git config user.email e.vanoosten@grons.nl
git add index.html thrift-rpc-missing-specification.pdf
git commit -m Update
git push origin HEAD:gh-pages
popd

rm -rf pages
