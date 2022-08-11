# Minecraft Server

## Server

- [PaperMC](https://papermc.io/)

## Plugins

- [GeyserMC](https://geysermc.org/)
- [Floodgate](https://github.com/GeyserMC/Floodgate)
- [GeyserSkinManager](https://github.com/Camotoy/GeyserSkinManager)
- [Multiverse-Core](https://github.com/Multiverse/Multiverse-Core)
- [Multiverse-Portals](https://github.com/Multiverse/Multiverse-Portals)

## Build

```sh
docker build -t mc:latest .
```

## Run

### The first run builds Spigot

```sh
./scripts/run.sh --image mc:latest --name mcs --ms 2G --mx 4G --detach-keys "ctrl-a,d"
```

or

```sh
curl -O https://raw.githubusercontent.com/tatat/mcs/main/scripts/run.sh \
  && bash ./run.sh --image ta2t/mcs:1.19.2 --name mcs --ms 2G --mx 4G --detach-keys "ctrl-a,d"
```

NOTE: Make sure to update `./data/eula.txt`.

### Start the container

```sh
docker start mcs
```

### Attach the console

```sh
docker attach mcs --detach-keys "ctrl-a,d"
```

### Stop the container

```sh
docker stop mcs
```

### Remove the container

```sh
docker rm mcs
```
