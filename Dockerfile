FROM openjdk:17-jdk-bullseye

WORKDIR /minecraft

COPY start.sh .

RUN mkdir -p ./plugins ./data

ADD https://papermc.io/api/v2/projects/paper/versions/1.19/builds/77/downloads/paper-1.19-77.jar paper-1.19-77.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/1155/artifact/bootstrap/spigot/target/Geyser-Spigot.jar ./plugins/Geyser-Spigot.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/70/artifact/spigot/build/libs/floodgate-spigot.jar ./plugins/floodgate-spigot.jar
ADD https://github.com/Camotoy/GeyserSkinManager/releases/download/1.6/GeyserSkinManager-Spigot.jar ./plugins/GeyserSkinManager-Spigot.jar
ADD https://edge.forgecdn.net/files/3462/546/Multiverse-Core-4.3.1.jar ./plugins/Multiverse-Core-4.3.1.jar
ADD https://edge.forgecdn.net/files/3113/114/Multiverse-Portals-4.2.1.jar ./plugins/Multiverse-Portals-4.2.1.jar

EXPOSE 25565
EXPOSE 19132/udp

CMD [ "./start.sh" ]
