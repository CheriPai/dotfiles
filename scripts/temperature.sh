#!/usr/bin/env bash
CORE="${1}"
OUTPUT=$(sensors)

IFS=$'\n'
DATA=$(echo "${OUTPUT}" | egrep -A4 "${CORE}")
CURRENT=$(echo "${DATA}" | grep -Po "(?<=Package id 0:  \+)([0-9]+)")
GPU=$(nvidia-smi | head -9 | tail -1 | grep -Po "(?<=%   )([0-9]+)")

echo "  ${CURRENT}°C  ${GPU}°C" | tail -n1

exit 0
