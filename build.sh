#!/bin/bash
set -e

exec 2>&1

#rm -rf dist/ peerjs/
#git clone https://github.com/peers/peerjs peerjs
cd peerjs
#git checkout v1.4.7
#git apply ../decoupling.diff
../node_modules/.bin/parcel build --no-minify --no-source-maps lib/exports.ts -d ../dist --out-file peerjs.min.js
cd ../
cat imports.js dist/peerjs.min.js > dist/react-native-peerjs.js
rm dist/peerjs.min.js

echo "Done. dist/react-native-peerjs.js"

