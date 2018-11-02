#!/bin/bash
cd "$(dirname "$0")"
test -e compile.sh || exit 1

mkdir -p url_cache

TMP="/tmp/crc_$RANDOM"
touch "$TMP"

echo "#-#-# Automatically Compiled Units"
for i in url/*; do
    test -e "$i" || continue;
    echo
    echo "#-#-# Unit:" "$(basename "$i")"
    curl "$(cat "$i")" > "$TMP" && {
        cat "$TMP" > url_cache/"$(basename "$i")"
    }
    cat url_cache/"$(basename "$i")"
done

for i in insert/*; do
    test -e "$i" || continue;

    echo
    echo "#-#-# Unit:" "$(basename "$i")"
    cat "$i"
done

for i in script/*; do
    test -e "$i" || continue;

    echo
    echo "#-#-# Unit:" "$(basename "$i")"
    bash "$i"
done

rm "$TMP"
