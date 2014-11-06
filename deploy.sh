#!/bin/bash
# compile
coffee --compile *.coffee
coffee --compile wwwfiles/js/*.coffee
jade wwwfiles/*.jade

# compress
uglifyjs wwwfiles/js/script.js --mangle --compress --screw-ie8 -o wwwfiles/js/script.js

echo "The files are ready to deploy."
