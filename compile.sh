#!/bin/bash
URL="https://github.com/shacknetisp/crawl-rc"

cd "$(dirname "$0")"
test -e compile.sh || exit 1

ROOT="$(pwd)"

TMP="/tmp/crc_$RANDOM"
touch "$TMP"

reset_lua() {
    echo ": --"
}

echo "#-#-# Automatically Compiled Units"
echo "#-#-# Generated from $URL"

echo "#-#-# Header"
reset_lua
cat core/header

echo
echo "#-#-# Units Begin"

process_dir() {
    dir="$1"
    for file in "$dir"/*; do
        test -e "$file" || continue

        if test -d "$file"; then
            process_dir "$file"
        else
            dext=${file##*.}
            ext=${dext#.}

            export CRC_FILE="$file"
            export CRC_DIR="$(basename "$(dirname "$file")")"
            export CRC_NAME="$(basename "$file" .$ext)"

            echo
            echo "#-#-# Unit: $CRC_NAME ($CRC_DIR/$CRC_NAME.$ext)"

            test -e "$ROOT/handlers/$ext" && {
                reset_lua
                bash "$ROOT/handlers/$ext"
            } || echo "No handler for extension: $ext" > /dev/stderr
        fi
    done
}

for dir in "$@"; do
    test -d "$dir" || { echo "Not a directory: $dir" > /dev/stderr; exit 1; }

    process_dir "$dir"
done

echo
echo "#-#-# Units End"
echo "#-#-# Footer"
reset_lua
cat core/footer

rm "$TMP"
