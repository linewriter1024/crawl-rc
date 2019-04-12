#!/bin/bash

# Repository information.
URL="https://github.com/shacknetisp/crawl-rc"

# Root directory.
ROOT="$(dirname "$0")"

# Output this line to "reset lua". This is a workaround for < > blocks not firing.
reset_lua() {
	echo ": --"
}

# Information.
echo "#-#-# Automatically Compiled Units"
echo "#-#-# Generated from $URL"

# Begin units.
echo
echo "#-#-# Units Begin"

# Process and output a file.
process_file() {
	file="$1"
	# With dot.
	dext=${file##*.}
	# Without dot.
	ext=${dext#.}

	# Set exported variables.
	export CRC_FILE="$file"
	export CRC_DIR="$(basename "$(dirname "$file")")"
	export CRC_NAME="$(basename "$file" .$ext)"

	# Unit header.
	echo
	echo "#-#-# Unit: $CRC_NAME ($CRC_DIR/$CRC_NAME.$ext)"

	# Test handler for ext.
	test -e "$ROOT/handlers/$ext" && {
		reset_lua
		# Run handler (with exported variables above).
		. "$ROOT/handlers/$ext"
	} || echo "No handler for extension: $ext" > /dev/stderr
}

# Recursively find and process a directory.
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

# Header before all other units.
process_dir "$ROOT/core/header"

# Process all paths in arguments.
for path in "$@"; do
	test -e "$path" || { echo "Does not exist: $path" > /dev/stderr; exit 1; }

	if test -d "$path"; then
		process_dir "$path"
	else
		process_file "$path"
	fi
done

# Footer after all other units.
process_dir "$ROOT/core/footer"
