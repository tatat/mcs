FROM openjdk:17-jdk-bullseye

WORKDIR /minecraft

COPY start.sh .

RUN mkdir -p ./plugins ./data

ADD https://api.papermc.io/v2/projects/paper/versions/1.19.4/builds/471/downloads/paper-1.19.4-471.jar paper-1.19.4-471.jar
ADD https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot ./plugins/Geyser-Spigot.jar
ADD https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot ./plugins/floodgate-spigot.jar
ADD https://github.com/Camotoy/GeyserSkinManager/releases/download/1.6/GeyserSkinManager-Spigot.jar ./plugins/GeyserSkinManager-Spigot.jar
ADD https://github.com/Multiverse/Multiverse-Core/releases/download/4.3.8/multiverse-core-4.3.8.jar ./plugins/multiverse-core-4.3.8.jar
ADD https://github.com/Multiverse/Multiverse-Portals/releases/download/4.2.2/multiverse-portals-4.2.2.jar ./plugins/multiverse-portals-4.2.2.jar

EXPOSE 25565
EXPOSE 19132/udp

CMD [ "./start.sh" ]
