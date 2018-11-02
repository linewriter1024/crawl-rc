#!/bin/bash

echo "# Bind first 10 spells to function keys."

alphabet="abcdefghijklmnopqrstuvwxyz"

for i in $(seq 0 9); do
    # WebTiles
    echo "macros += M \{-$(expr 1011 + $i)} z${alphabet:$i:1}"
    # Local
    echo "macros += M \{-$(expr 1073741882 + $i)} z${alphabet:$i:1}"
done
