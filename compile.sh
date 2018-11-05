#!/bin/bash
URL="https://github.com/shacknetisp/crawl-rc"

ROOT="$(dirname "$0")"

reset_lua() {
    echo ": --"
}

echo "#-#-# Automatically Compiled Units"
echo "#-#-# Generated from $URL"

echo "#-#-# Header"
reset_lua
cat $ROOT/core/header

echo
echo "#-#-# Units Begin"

process_file() {
    file="$1"
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
}

process_dir() {
    dir="$1"
    for file in "$dir"/*; do
        test -e "$file" || continue

        if test -d "$file"; then
            process_dir "$file"
        else
            process_file "$file"
        fi
    done
}

for path in "$@"; do
    test -e "$path" || { echo "Does not exist: $path" > /dev/stderr; exit 1; }

    if test -d "$path"; then
        process_dir "$path"
    else
        process_file "$path"
    fi
done

echo
echo "#-#-# Units End"
echo "#-#-# Footer"
reset_lua
cat $ROOT/core/footer
