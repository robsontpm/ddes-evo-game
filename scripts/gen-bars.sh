#!/bin/bash

input_file="../run-tasks/list-of-interesting-regions.txt"
counter=1

while read -r line; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    # Read fields
    read -r start end gamma_step T comment <<<"$line"

    # Strip quotes from comment if present
    comment=${comment//\'/}

    # Compute mid point
    mid=$(awk "BEGIN {printf \"%.6f\", ($start + $end) / 2}")

    echo "# Bar $counter: x in [$start, $end] '$comment'"
    echo "set object $counter rectangle from $start, graph 0 to $end, graph 1 fc rgb \"gray\" fs solid 0.3"
    echo "set label $counter \"$counter\" at $mid, graph 0.97 center"
    echo ""

    ((counter++))
done < "$input_file"
