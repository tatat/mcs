#!/bin/bash

set -u

BASE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
MIN_MEMORY_SIZE="1G"
MAX_MEMORY_SIZE="2G"

while [[ $# -gt 0 ]]; do
  case $1 in
    --ms)
      MIN_MEMORY_SIZE="$2"
      shift
      shift
      ;;
    --mx)
      MAX_MEMORY_SIZE="$2"
      shift
      shift
      ;;
    -*|--*)
      echo "Error: Unknown option $1" >&2
      exit 1
      ;;
    *)
      echo "Error: Unknown argument $1" >&2
      exit 1
      ;;
  esac
done

SPIGOT_JAR="$(find "$BASE_DIR/build" -mindepth 1 -maxdepth 1 -name "spigot-*.jar" | sort | tail -1)"

if [ -z "$SPIGOT_JAR" ]; then
  echo "Error: Couldn't find spigot-*.jar" >&2
  exit 1
fi

cd "$BASE_DIR/data"

java -Xms$MIN_MEMORY_SIZE -Xmx$MAX_MEMORY_SIZE -XX:+UseG1GC -jar $SPIGOT_JAR --plugins "$BASE_DIR/plugins" nogui
