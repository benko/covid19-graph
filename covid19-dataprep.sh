#!/bin/bash
#
# Recreates COVID-19 downloadable data file into something usable by gnuplot index.
#
# Usage: covid19-dataprep.sh <datafile>
# Output: covid19-current-world.csv
#
if [ -z "$1" ]; then
    echo "FATAL: Need data file to work with!"
    exit 1
fi
DATAFILE="$1"

echo -n > covid19-current-world.csv
echo -n "Processing: "

COUNTRIES="$(tail -n+2 "${DATAFILE}" | cut -f9 -d, | sort -u)"
for c in ${COUNTRIES}; do
    echo -n '.'
    grep ",$c," "${DATAFILE}" >> covid19-current-world.csv
    echo -e '\n' >> covid19-current-world.csv
done

echo " done."

echo -n > covid19-current-world.idx
echo -n "Creating index... "
IDX=0
for c in ${COUNTRIES}; do
    echo "${IDX} ${c}" >> covid19-current-world.idx
    IDX=$((IDX + 1))
done
echo "done."

