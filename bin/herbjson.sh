#!/bin/sh

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "[" > ../herbarium/herbarium.json

find ../herbarium/ -type f | \
    grep -v "herbarium.json" | sort | \
    gawk '{print gensub(/^\.\.\/herbarium\/([^/]+)\/(.+)$/,"{\"image\":\"\\2\",\"gs_id\":\"\\1\"},","G",$0)}' >> ../herbarium/herbarium.json

sed -E -i '$ s/,$//g'  ../herbarium/herbarium.json

echo "]" >> ../herbarium/herbarium.json
