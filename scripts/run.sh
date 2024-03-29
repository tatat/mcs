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

mkdir -p "$PWD/plugins/Geyser-Spigot"
mkdir -p "$PWD/plugins/PluginMetrics"
mkdir -p "$PWD/plugins/floodgate"
mkdir -p "$PWD/plugins/GeyserSkinManager"
mkdir -p "$PWD/plugins/Multiverse-Core"
mkdir -p "$PWD/plugins/Multiverse-Portals"
mkdir -p "$PWD/plugins/bStats"
mkdir -p "$PWD/plugins/PluginMetrics"
mkdir -p "$PWD/data"

docker run -it \
  ${OPTIONS[@]+"${OPTIONS[@]}"} \
  -v "$PWD/plugins/Geyser-Spigot:/minecraft/plugins/Geyser-Spigot" \
  -v "$PWD/plugins/PluginMetrics:/minecraft/plugins/PluginMetrics" \
  -v "$PWD/plugins/floodgate:/minecraft/plugins/floodgate" \
  -v "$PWD/plugins/GeyserSkinManager:/minecraft/plugins/GeyserSkinManager" \
  -v "$PWD/plugins/multiverse-core:/minecraft/plugins/Multiverse-Core" \
  -v "$PWD/plugins/multiverse-portals:/minecraft/plugins/Multiverse-Portals" \
  -v "$PWD/plugins/bStats:/minecraft/plugins/bStats" \
  -v "$PWD/plugins/PluginMetrics:/minecraft/plugins/PluginMetrics" \
  -v "$PWD/data:/minecraft/data" \
  -p 19132-19133:19132-19133/udp \
  -p 25565:25565 \
  "$IMAGE" \
  ./start.sh --ms "$MIN_MEMORY_SIZE" --mx "$MAX_MEMORY_SIZE"
