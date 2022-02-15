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

PAPER_JAR="$(find "$BASE_DIR" -mindepth 1 -maxdepth 1 -name "paper-*.jar" | sort | tail -1)"

if [ -z "$PAPER_JAR" ]; then
  echo "Error: Couldn't find paper-*.jar" >&2
  exit 1
fi

cd "$BASE_DIR/data"

java -Xms$MIN_MEMORY_SIZE -Xmx$MAX_MEMORY_SIZE -XX:+UseG1GC -jar "$PAPER_JAR" --plugins "$BASE_DIR/plugins" --nogui
