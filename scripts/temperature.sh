#!/usr/bin/env bash
CORE="${1}"
OUTPUT=$(sensors -Au)

IFS=$'\n'
DATA=$(echo "${OUTPUT}" | egrep -A4 "${CORE}")
CURRENT=$(echo "${DATA}" | grep -Po "(?<=temp1_input: )([0-9]+)")

echo "${CURRENT}°" | tail -n1

exit 0
