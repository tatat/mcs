#!/bin/bash

set -u

MIN_MEMORY_SIZE="1G"
MAX_MEMORY_SIZE="2G"

OPTIONS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --image)
      IMAGE="$2"
      shift
      shift
      ;;
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
    --name)
      OPTIONS+=("--name" "$2")
      shift
      shift
      ;;
    --detach-keys)
      OPTIONS+=("--detach-keys" "$2")
      shift
      shift
      ;;
    -d)
      OPTIONS+=("-d")
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

docker run -it \
  ${OPTIONS[@]+"${OPTIONS[@]}"} \
  -v "$PWD/plugins/Geyser-Spigot:/minecraft/plugins/Geyser-Spigot" \
  -v "$PWD/plugins/PluginMetrics:/minecraft/plugins/PluginMetrics" \
  -v "$PWD/plugins/floodgate:/minecraft/plugins/floodgate" \
  -v "$PWD/data:/minecraft/data" \
  -p 19132-19133:19132-19133/udp \
  -p 25565:25565 \
  "$IMAGE" \
  ./start.sh --ms "$MIN_MEMORY_SIZE" --mx "$MAX_MEMORY_SIZE"
