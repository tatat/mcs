FROM openjdk:17-jdk-bullseye

WORKDIR /minecraft

COPY start.sh .

RUN mkdir -p ./plugins ./data

ADD https://api.papermc.io/v2/projects/paper/versions/1.19.3/builds/448/downloads/paper-1.19.3-448.jar paper-1.19.3-448.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/1326/artifact/bootstrap/spigot/build/libs/Geyser-Spigot.jar ./plugins/Geyser-Spigot.jar
ADD https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/77/artifact/spigot/build/libs/floodgate-spigot.jar ./plugins/floodgate-spigot.jar
ADD https://github.com/Camotoy/GeyserSkinManager/releases/download/1.6/GeyserSkinManager-Spigot.jar ./plugins/GeyserSkinManager-Spigot.jar
ADD https://github.com/Multiverse/Multiverse-Core/releases/download/4.3.8/multiverse-core-4.3.8.jar ./plugins/multiverse-core-4.3.8.jar
ADD https://github.com/Multiverse/Multiverse-Portals/releases/download/4.2.2/multiverse-portals-4.2.2.jar ./plugins/multiverse-portals-4.2.2.jar

EXPOSE 25565
EXPOSE 19132/udp

CMD [ "./start.sh" ]
