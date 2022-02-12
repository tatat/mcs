#!/bin/bash

BASE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

cd "$BASE_DIR"

if [ ! -f "$BASE_DIR/build/spigot-${SPIGOT_VERSION}.jar" ]; then
  (cd "$BASE_DIR/build" && java -jar BuildTools.jar --rev ${SPIGOT_VERSION})
fi

"$@"
